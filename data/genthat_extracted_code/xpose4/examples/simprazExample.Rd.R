library(xpose4)


### Name: simprazExample
### Title: Function to create files for the simulated prazosin example in
###   Xpose
### Aliases: simprazExample
### Keywords: methods

### ** Examples


od = setwd(tempdir()) # move to a temp directory
(cur.files <- dir()) # current files in temp directory

simprazExample(overwrite=TRUE) # write files

(new.files <- dir()[!(dir() %in% cur.files)])  # what files are new here?

file.remove(new.files) # remove these files
setwd(od)  # restore working directory




