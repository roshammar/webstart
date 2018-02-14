#!/usr/bin/env bash

bower install jquery
bower install bulma
bower install font-awesome
bower install handlebars

mkdir static
mkdir static/css
mkdir static/js
mkdir static/img

mv bower_components/jquery/dist/jquery.min.js static/js
mv bower_components/bulma/css/bulma.css static/css
mv bower_components/font-awesome/svg-with-js/js/fontawesome-all.js static/js
mv bower_components/handlebars/handlebars.min.js static/js

touch static/css/main.css
touch static/js/main.js

rm -r bower_components

# Find script directory, resolving symlinks
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
SCRIPT_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

cp $SCRIPT_DIR/index.html static/