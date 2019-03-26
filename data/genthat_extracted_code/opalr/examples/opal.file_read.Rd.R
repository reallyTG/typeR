library(opalr)


### Name: opal.file_read
### Title: Read a file
### Aliases: opal.file_read

### ** Examples

## Not run: 
##D o <- opal.login('administrator','password','https://opal-demo.obiba.org')
##D # read into folder
##D opal.file_read(o,"DatabaseTest.sav", "/tmp")
##D # read and rename
##D opal.file_read(o,"test/DatabaseTest.sav", "/tmp/Test.sav")
##D # user home expansion
##D opal.file_read(o,"DatabaseTest.sav", "~/coucou/pwel.sav")
##D opal.logout(o)
## End(Not run)



