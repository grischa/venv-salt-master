#!/bin/bash

pip install virtualenvwrapper
source virtualenvwrapper.sh
mkvirtualenv -a `pwd` salt-master -r requirements.txt
rm $VIRTUAL_ENV/bin/postactivate
ln -s `pwd`/utils/venv-postactivate $VIRTUAL_ENV/bin/postactivate
rm $VIRTUAL_ENV/bin/predeactivate
ln -s `pwd`/utils/venv-predeactivate $VIRTUAL_ENV/bin/predeactivate
deactivate
workon salt-master
echo "root_dir: $SALT_CONFIG_DIR" >> $SALT_CONFIG_DIR/master-local
echo "user: $USER" >> $SALT_CONFIG_DIR/master-local
