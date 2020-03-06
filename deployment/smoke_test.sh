#!/bin/bash

# usage: invoke from the project root directory

set -e

echo "Starting tests..."

tests_count=0
failures_count=0

declare -a pages
pages=("index.html" "mission.html" "apply.html" "people.html")
for p in "${pages[@]}"; do
    if ! test -e "./_site/$p" ; then
        echo "page $p does not exist"
        (( ++failures_count ))
    fi
    (( ++tests_count ))
done


echo "Finished tests. Failed $failures_count of $tests_count tests."

if [[ $failures_count -ne 0 ]]; then
  exit 1
fi
