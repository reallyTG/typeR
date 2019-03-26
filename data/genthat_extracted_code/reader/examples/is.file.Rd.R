library(reader)


### Name: is.file
### Title: Test whether a file exists in a target directory, or alternative
###   list of directories.
### Aliases: is.file

### ** Examples

orig.dir <- getwd(); setwd(tempdir()); # move to temporary dir
l.fn <- "temp.txt"
writeLines("test",con=l.fn)
some.local.files <- narm(list.files()[1:10])
print(some.local.files)
is.file(l.fn)
is.file(l.fn,dir=getwd())
is.file(some.local.files)
# add a non-valid file to the list to see what happens
is.file(c(some.local.files,"fakefile.unreal"))
is.file(c(some.local.files,"fakefile.unreal"),combine=FALSE)
unlink(l.fn)
setwd(orig.dir) # reset working dir to original



