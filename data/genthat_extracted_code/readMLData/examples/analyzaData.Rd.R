library(readMLData)


### Name: analyzeData
### Title: Determine the type of values in each column of a data frame.
### Aliases: analyzeData
### Keywords: data

### ** Examples

  pathData <- getPath("exampleData")
  pathDescription <- getPath("exampleDescription")
  dsList <- prepareDSList(pathData, pathDescription)
  dat <- dsRead(dsList, "glass")
  analyzeData(dat)



