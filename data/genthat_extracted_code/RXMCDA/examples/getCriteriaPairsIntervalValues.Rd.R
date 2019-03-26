library(RXMCDA)


### Name: getCriteriaPairsIntervalValues
### Title: Get interval values related to pairs of criteria
### Aliases: getCriteriaPairsIntervalValues
### Keywords: methods

### ** Examples

tree <- xmlTreeParse(system.file("extdata",
                                 "testFile.xml",
                                 package="RXMCDA"), 
                     useInternalNodes=TRUE)

critIDs <- getCriteriaIDs(tree)

pairsVals <- getCriteriaPairsIntervalValues(tree, critIDs[[1]],
                                            mcdaConcept="interactionIntervals")



