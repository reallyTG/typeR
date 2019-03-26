library(RXMCDA)


### Name: getCriteriaPairsComparisons
### Title: Get comparisons of pairs of criteria
### Aliases: getCriteriaPairsComparisons
### Keywords: methods

### ** Examples

tree <- xmlTreeParse(system.file("extdata",
                                 "testFile.xml",
                                 package="RXMCDA"), 
                     useInternalNodes=TRUE)

critIDs <- getCriteriaIDs(tree)

comps <- getCriteriaPairsComparisons(tree, critIDs[[1]])



