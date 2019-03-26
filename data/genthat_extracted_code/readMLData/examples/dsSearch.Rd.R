library(readMLData)


### Name: dsSearch
### Title: Search a dataset by string matching against the names stored in
###   'dsList'.
### Aliases: dsSearch
### Keywords: data

### ** Examples

  pathData <- getPath("exampleData")
  pathDescription <- getPath("exampleDescription")
  dsList <- prepareDSList(pathData, pathDescription)
  dsSearch(dsList, "ident", searchField="fullName", searchType="anywhere")



