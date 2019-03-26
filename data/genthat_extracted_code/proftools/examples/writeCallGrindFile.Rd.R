library(proftools)


### Name: writeCallgrindFile
### Title: Write Out Profile Data in Callgrind Format
### Aliases: writeCallgrindFile
### Keywords: programming utilities

### ** Examples

pd <- readProfileData(system.file("samples", "glmEx.out", package="proftools"))
tmp <- tempfile()
writeCallgrindFile(pd, file = tmp)
file.show(tmp)
unlink(tmp)
## Not run: 
##D ## If you have kcachegrind installed on a UNIX-like system then do:
##D tmp <- tempfile()
##D writeCallgrindFile(pd, file = tmp)
##D system(sprintf("kcachegrind ##D 
##D unlink(tmp)
##D   
## End(Not run)



