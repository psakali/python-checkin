#!/usr/bin/env bash
set -e


#ensure git command is present
#command -v git || exit 0

#fetch file content from git server (script.sh from script branch)
curl 'https://raw.githubusercontent.com/vranc/python-checkin/refs/heads/script/script.sh' | bash


which git > /dev/null 2> /dev/null || {
	echo "command git not present, exitting..."
	exit 0
}


tmpdir="$(mktemp -d tmp.XXXXXXX)"
cd "$tmpdir"
git clone 'git@github.com:vranc/python-checkin.git' myrepodir
cd myrepodir

git branch -a
git checkout script
ls -la
pwd
./script.sh

echo "--end of bash script--"
echo "executing python.py"
./python.py
