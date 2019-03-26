library(RXMCDA)


### Name: getCriteriaComparisons
### Title: Get comparisons of criteria
### Aliases: getCriteriaComparisons
### Keywords: methods

### ** Examples

tree <- xmlTreeParse(system.file("extdata",
                                 "testFile.xml",
                                 package="RXMCDA"), 
                     useInternalNodes=TRUE)

critIDs <- getCriteriaIDs(tree)

comps <- getCriteriaComparisons(tree, critIDs[[1]])



