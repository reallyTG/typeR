library(RXMCDA)


### Name: getAlternativesAffectations
### Title: Get alternative affectations
### Aliases: getAlternativesAffectations
### Keywords: methods

### ** Examples

tree <- xmlTreeParse(system.file("extdata",
                                 "testFile.xml",
                                 package="RXMCDA"), 
                                 useInternalNodes=TRUE)

alternativesIDs <- getAlternativesIDs(tree)
categoriesIDs <- getCategoriesIDs(tree)
altAff <- getAlternativesAffectations(tree, 
                                      alternativesIDs[[1]], categoriesIDs[[1]])




