#!/bin/sh

set -ux

cd

if [ ! -d Local-Repo/dotwsl ] ; then
  git clone https://github.com/w4jcb/dotwsl.git Local-Repo/dotwsl
fi

cd Local-Repo/dotwsl

DIR=${PWD} # folder this file is in
homedir=/home/${USER} #/home/user_name

# dotfiles directory
dotfiledir=${DIR}

# list of files/folders to symlink in ${homedir}
files="bash_aliases"

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd ${dotfiledir}
echo "...done"

# create symlinks (will overwrite old dotfiles)
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${dotfiledir}/.${file} ${homedir}/.${file}
done
    
# Install packages I can't live without. Just put them in the text file.
xargs -a packages.txt sudo apt install

# Install SNAP packages I can't live without.
xargs -a snaps.txt sudo snap install
