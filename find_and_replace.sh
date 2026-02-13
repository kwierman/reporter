#!/bin/bash
# find_and_replace.sh

# This is a script to rename everything in this directory to your new package name
# Remove this script after your repository is setup

echo "Find and replace in current directory!"
echo "Existing string?"
read existing
echo "Replacement string?"
read replacement
echo "Replacing all occurences of $existing with $replacement in files matching $filepattern"

declare -a filepatterns=("*.py" "*.toml" "Makefile" "*.rst" "*.md" "docker/Dockerfile")

## now loop through the above array
for filepattern in "${filepatterns[@]}"
do
    find . -type f -name $filepattern -print0 | xargs -0 sed -i '' -e "s/$existing/$replacement/g"
done


