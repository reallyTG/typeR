library(RXMCDA)


### Name: getCriteriaComparisonsLabels
### Title: Get comparisons of alternatives
### Aliases: getCriteriaComparisonsLabels
### Keywords: methods

### ** Examples

tree <- xmlTreeParse(system.file("extdata",
                                 "testFile.xml",
                                 package="RXMCDA"),
                     useInternalNodes=TRUE)

critIDs <- getCriteriaIDs(tree)

comps <- getCriteriaComparisonsLabels(tree, critIDs[[1]])



