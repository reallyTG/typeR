library(xpose4)


### Name: tabulate.parameters
### Title: Tabulate the population parameter estimates
### Aliases: tabulate.parameters
### Keywords: methods

### ** Examples


od = setwd(tempdir()) # move to a temp directory
(cur.files <- dir()) # current files in temp directory

simprazExample(overwrite=TRUE) # write files
(new.files <- dir()[!(dir() %in% cur.files)])  # what files are new here?
xpdb <- xpose.data(1) # read in files to xpose database

tabulate.parameters(xpdb)

file.remove(new.files) # remove these files
setwd(od)  # restore working directory




