library(readMLData)


### Name: getType
### Title: Determines the type vector for an input data set.
### Aliases: getType
### Keywords: data

### ** Examples

  pathData <- getPath("exampleData")
  pathDescription <- getPath("exampleDescription")
  dsList <- prepareDSList(pathData, pathDescription)
  dat <- dsRead(dsList, "annealing")
  getType(dat)



