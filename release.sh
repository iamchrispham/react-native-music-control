#!/bin/bash

# Check if an argument was provided (major, minor, or patch)
if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Please specify 'major', 'minor', or 'patch'."
    exit 1
fi

# Ensure the argument is valid
if [[ "$1" != "major" && "$1" != "minor" && "$1" != "patch" ]]
  then
    echo "Invalid argument: $1. Please specify 'major', 'minor', or 'patch'."
    exit 1
fi

# Navigate to the directory containing your package.json, if necessary
# cd /path/to/your/project

# Bump the version in package.json and create a git tag
# This command also commits the changed package.json file
npm version $1 -m "release: Upgrade to %s."

# Push the commit and tag to GitHub
git push && git push --tags

echo "Version bumped to $(jq -r '.version' package.json), and changes pushed to GitHub."
