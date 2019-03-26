library(readMLData)


### Name: dsSort
### Title: Sort the rows of a data frame.
### Aliases: dsSort
### Keywords: data

### ** Examples

  pathData <- getPath("exampleData")
  pathDescription <- getPath("exampleDescription")
  dsList <- prepareDSList(pathData, pathDescription)
  dat <- dsRead(dsList, "glass")
  sorted <- dsSort(dat)



