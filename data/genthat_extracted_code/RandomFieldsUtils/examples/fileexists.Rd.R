library(RandomFieldsUtils)


### Name: FileExists
### Title: Files
### Aliases: FileExists LockRemove LockFile
### Keywords: file utilities

### ** Examples

## Not run: 
##D ## the next command checks whether the file 'data.rda'
##D ## or the file 'data.rda.lock' exists. If so, a positive
##D ## value is returned. If not, the file 'data.rda.lock'
##D ## is created and the value 0 returned.
##D FileExists("data.rda")
##D 
##D ## the next command deletes the file 'data.rda.lock'
##D LockRemove("data.rda")
## End(Not run)



