library(RXMCDA)


### Name: getCriteriaIntervalValues
### Title: Get interval values related to criteria
### Aliases: getCriteriaIntervalValues
### Keywords: methods

### ** Examples

tree <- xmlTreeParse(system.file("extdata",
                                 "testFile.xml",
                                 package="RXMCDA"), 
                     useInternalNodes=TRUE)

critIDs <- getCriteriaIDs(tree)

intVals <- getCriteriaIntervalValues(tree, critIDs[[1]])




