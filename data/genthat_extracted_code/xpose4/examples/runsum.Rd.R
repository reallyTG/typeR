library(xpose4)


### Name: runsum
### Title: Print run summary in Xpose 4
### Aliases: runsum
### Keywords: methods

### ** Examples

od = setwd(tempdir()) # move to a temp directory
(cur.files <- dir()) # current files in temp directory

simprazExample(overwrite=TRUE) # write files
(new.files <- dir()[!(dir() %in% cur.files)])  # what files are new here?

xpdb <- xpose.data(1)
runsum(xpdb)


file.remove(new.files) # remove these files
setwd(od)  # restore working directory





