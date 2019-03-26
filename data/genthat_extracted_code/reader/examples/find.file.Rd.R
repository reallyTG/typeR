library(reader)


### Name: find.file
### Title: Search for a directory to add to the path so that a file exists.
### Aliases: find.file

### ** Examples

orig.dir <- getwd(); setwd(tempdir()); # move to temporary dir
l.fn <- "temp.txt"
writeLines("test",con=l.fn)
find.file(l.fn)
find.file(l.fn,dir=getwd())
unlink(l.fn)
# not run # common.places <- ## <<add local folder here>> ##
# not run # d.fn <- cat.path(common.places[1],l.fn)
# write this example file to the first of the folders #
# not run # if(!file.exists(d.fn)) {  writeLines("test2",con=d.fn) }
# search the local folders for a
# a file named 'temp.txt'
# not run # find.file(l.fn,dir=getwd(),dirs=common.places)
# unlink(d.fn) # run only if test file produced
setwd(orig.dir) # reset working dir to original



