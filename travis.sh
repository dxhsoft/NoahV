#!/bin/sh

FILE_NAME="noahv"

CUR_DIR=$(cd `dirname $0`; pwd)

# prepare

if [ -d $CUR_DIR/template/common/noahv ]; then
    rm -rf $CUR_DIR/template/common/noahv
fi

cd $CUR_DIR/template/common
echo $(pwd)

echo "install node_module"
npm install

# build
echo "start build common project"

node scripts/build.js

if [ $? -ne 0 ]; then
    echo "common project build failed!"
    exit 1;
fi

echo "common project build success"



# prepare

if [ -d $CUR_DIR/template/dashboard/noahv ]; then
    rm -rf $CUR_DIR/template/dashboard/noahv
fi

cd $CUR_DIR/template/dashboard

echo "install node_module"
npm install

# build
echo "start build dashboard project"

node scripts/build.js

if [ $? -ne 0 ]; then
    echo "dashboard project build failed!"
    exit 1;
fi

echo "dashboard project build success"
