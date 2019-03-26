library(berryFunctions)


### Name: newFilename
### Title: Create new filename if file already exists
### Aliases: newFilename
### Keywords: file

### ** Examples


fns <- c("dummy1", "dummy2.txt", "berryFunctions.Rproj",
         "README.md", "dummy2.dummy", "DESCRIPTION", "dummy4.R", "dummy5")
newFilename(fns)
newFilename(fns, ignore=TRUE)
newFilename(fns, ignore=rep(c(TRUE,FALSE), each=4) )
newFilename(fns, ignore=rep(c(TRUE,FALSE), each=4), tellignore=FALSE)
newFilename(fns, ntrunc=2)
newFilename(fns, overwrite=TRUE, ign=c(TRUE,TRUE,rep(FALSE,6)))
newFilename("README.md")
newFilename("dummy", mid=" ") # no line break




