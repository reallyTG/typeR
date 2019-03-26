library(opalr)


### Name: opal.file_mv
### Title: Move and/or rename a file
### Aliases: opal.file_mv

### ** Examples

## Not run: 
##D o <- opal.login('administrator','password','https://opal-demo.obiba.org')
##D # move a file to another folder
##D opal.file_mv(o, '/home/administrator/export/some-data.csv', '/home/userx/deliverables')
##D # rename a file
##D opal.file_mv(o, '/home/administrator/export/some-data-20170123.csv', 
##D                 '/home/administrator/export/some-data.csv')
##D # move and rename a file
##D opal.file_mv(o, '/home/administrator/export/some-data-20170123.csv', 
##D                 '/home/userx/deliverables/some-data.csv')
##D opal.logout(o)
## End(Not run)



