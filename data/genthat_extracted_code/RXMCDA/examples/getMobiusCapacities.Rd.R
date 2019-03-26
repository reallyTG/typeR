library(RXMCDA)


### Name: getMobiusCapacities
### Title: Get Mobius capacities
### Aliases: getMobiusCapacities
### Keywords: methods

### ** Examples

tree <- xmlTreeParse(system.file("extdata",
                                 "testFile.xml",
                                 package="RXMCDA"),
                     useInternalNodes=TRUE)

critIDs <- getCriteriaIDs(tree)

capa <- getMobiusCapacities(tree, critIDs[[1]], 5, 5,
                            mcdaConcept="mobiusCapacity")



