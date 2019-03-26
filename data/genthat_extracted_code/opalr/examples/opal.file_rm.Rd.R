library(opalr)


### Name: opal.file_rm
### Title: Remove a file
### Aliases: opal.file_rm

### ** Examples

## No test: 
o <- opal.login('administrator','password','https://opal-demo.obiba.org')
# remove a file
opal.file_rm(o, '/home/administrator/export/some-data.csv')
# remove recursively a folder
opal.file_rm(o, '/home/administrator/export')
opal.logout(o)
## End(No test)



