library(RXMCDA)


### Name: getCriteriaValues
### Title: Get values related to criteria
### Aliases: getCriteriaValues
### Keywords: methods

### ** Examples

tree <- xmlTreeParse(system.file("extdata",
                                 "testFile.xml",
                                 package="RXMCDA"), 
                     useInternalNodes=TRUE)

critIDs <- getCriteriaIDs(tree)

critVals <- getCriteriaValues(tree, critIDs[[1]])



