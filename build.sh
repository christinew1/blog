#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo

# Delete folders to regenerate
rm -rf ./docs/page/
rm -rf ./docs/categories/
rm -rf ./docs/post/
rm -rf ./docs/samples/
rm -rf ./docs/tags/

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

