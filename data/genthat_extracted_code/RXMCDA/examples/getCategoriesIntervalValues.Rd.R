library(RXMCDA)


### Name: getCategoriesIntervalValues
### Title: Get interval values related to categories
### Aliases: getCategoriesIntervalValues
### Keywords: methods

### ** Examples

tree <- xmlTreeParse(system.file("extdata",
                                 "testFile.xml",
                                 package="RXMCDA"), 
                     useInternalNodes=TRUE)

categoriesIDs <- getCategoriesIDs(tree)
intervalValues <- getCategoriesIntervalValues(tree, categoriesIDs[[1]])




