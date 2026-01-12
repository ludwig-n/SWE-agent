#!/bin/bash

# This script obtains a patch file using 'git diff' and saves it to the path specified as the first argument.
# Assumes that it is run from the root of the repository.

# Before getting the patch, runs the script from the gitignores/ subfolder for the given language, if present.
# This adds paths of compilation artifacts to .gitignore, so that they do not appear in the final patch file.
# The scripts were copied from MSWE-agent with minor fixes:
# https://github.com/multi-swe-bench/MSWE-agent/tree/main/multi_swe_bench/utils/gitignores

# Any changes to the .gitignore file itself, including ones made by the above script, are ignored in the patch.

if [ -d /root/SWE-agent/sweagent/scripts/gitignores/${INSTANCE_LANGUAGE}.sh ]
    /root/SWE-agent/sweagent/scripts/gitignores/${INSTANCE_LANGUAGE}.sh
else
    echo "No gitignore script found for language '${INSTANCE_LANGUAGE}'. Skipping gitignore script."
fi

git add -A && git diff --cached ':!.gitignore' >$1
