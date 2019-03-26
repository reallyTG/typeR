library(RXMCDA)


### Name: getAlternativesValues
### Title: Get values related to alternatives
### Aliases: getAlternativesValues
### Keywords: methods

### ** Examples

tree <- xmlTreeParse(system.file("extdata",
                                 "testFile.xml",
                                 package="RXMCDA"),
                     useInternalNodes=TRUE)

altIDs <- getAlternativesIDs(tree)

altVals <- getAlternativesValues(tree, altIDs[[1]])



