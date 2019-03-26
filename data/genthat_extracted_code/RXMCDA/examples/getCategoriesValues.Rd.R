library(RXMCDA)


### Name: getCategoriesValues
### Title: Get values related to categories
### Aliases: getCategoriesValues
### Keywords: methods

### ** Examples

tree <- xmlTreeParse(system.file("extdata",
                                 "testFile.xml",
                                 package="RXMCDA"), 
                     useInternalNodes=TRUE)

categoriesIDs <- getCategoriesIDs(tree)
categoriesValues <- getCategoriesValues(tree, categoriesIDs[[1]])




