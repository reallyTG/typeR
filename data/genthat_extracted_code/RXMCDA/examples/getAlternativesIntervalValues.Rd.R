library(RXMCDA)


### Name: getAlternativesIntervalValues
### Title: Get interval values related to alternatives
### Aliases: getAlternativesIntervalValues
### Keywords: methods

### ** Examples

tree <- xmlTreeParse(system.file("extdata",
                                 "testFile.xml",
                                 package="RXMCDA"), 
                     useInternalNodes=TRUE)

altIDs <- getAlternativesIDs(tree)

altVals <- getAlternativesIntervalValues(tree, altIDs[[1]], 
                                         mcdaConcept="alternativesIntervalValues")



