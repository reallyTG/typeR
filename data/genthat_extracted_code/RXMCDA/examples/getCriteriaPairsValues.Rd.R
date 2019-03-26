library(RXMCDA)


### Name: getCriteriaPairsValues
### Title: Get values related to pairs of criteria
### Aliases: getCriteriaPairsValues
### Keywords: methods

### ** Examples

tree <- xmlTreeParse(system.file("extdata",
                                 "testFile.xml",
                                 package="RXMCDA"), 
                     useInternalNodes=TRUE)

critIDs <- getCriteriaIDs(tree)

pairsVals <- getCriteriaPairsValues(tree, critIDs[[1]],
                                          mcdaConcept="interactionValues")



