library(readMLData)


### Name: checkType
### Title: Compares the type of columns stored in 'dsList' and in a data
###   set itself.
### Aliases: checkType
### Keywords: data

### ** Examples

  pathData <- getPath("exampleData")
  pathDescription <- getPath("exampleDescription")
  dsList <- prepareDSList(pathData, pathDescription)
  checkType(dsList, 1)



