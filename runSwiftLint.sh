#!/bin/bash
read -p "Drag the swift file to clean: " pathName
pathName=${pathName}

script_dir=$(dirname "$0")

IFS=$'\n' read -d '' -r -a lines < <(swiftlint $pathName --config $script_dir/configSeiftLint.yml)

desktop_dir="$HOME/Desktop"


echo "" > "$desktop_dir/swiftErrors.txt"

for line in "${lines[@]}"; do
    result="line${line/$pathName/}"
    
    echo $result >> "$desktop_dir/swiftErrors.txt"
    echo "" >> "$desktop_dir/swiftErrors.txt"
done

open $desktop_dir/swiftErrors.txt
