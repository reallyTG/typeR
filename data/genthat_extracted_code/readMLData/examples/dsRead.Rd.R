library(readMLData)


### Name: dsRead
### Title: Loading machine learning data from a directory tree using a
###   unified interface.
### Aliases: dsRead
### Keywords: data

### ** Examples

  pathData <- getPath("exampleData")
  pathDescription <- getPath("exampleDescription")
  dsList <- prepareDSList(pathData, pathDescription)
  dat <- dsRead(dsList, "glass")
  dim(dat)



