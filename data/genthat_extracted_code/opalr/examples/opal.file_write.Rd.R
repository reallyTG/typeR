library(opalr)


### Name: opal.file_write
### Title: Write a file
### Aliases: opal.file_write

### ** Examples

## Not run: 
##D o <- opal.login('administrator','password','https://opal-demo.obiba.org')
##D # user home expansion
##D opal.file_write(o, "~/spss/DatabaseTest.sav")
##D # rename file
##D opal.file_write(o, "/home/administrator/spss/DatabaseTest.sav", "x.sav")
##D # create sub-folder
##D opal.file_write(o, "/home/administrator/spss/DatabaseTest.sav", "test/x.sav")
##D opal.logout(o)
## End(Not run)



