#!/bin/bash -e
version=3.22
build=1
sudo apt remove '^cmake.*' -y --purge
sudo apt install build-essential libtool autoconf unzip wget libssl-dev -y
sudo apt autoremove -y
[! -d "$PWD/temp" ] && rm -rf $PWD/temp
mkdir $PWD/temp
cd $PWD/temp
wget https://cmake.org/files/v$version/cmake-$version.$build.tar.gz
tar -xzvf cmake-$version.$build.tar.gz
cd cmake-$version.$build/
./bootstrap
make -j$(nproc)
sudo make install