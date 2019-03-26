library(antaresRead)


### Name: removeVirtualAreas
### Title: Remove virtual areas
### Aliases: removeVirtualAreas

### ** Examples

## Not run: 
##D 
##D # Assume we have a network with two virtual areas acting as pump storage and
##D # an area representing offshore production
##D #
##D #  offshore
##D #     |
##D # real area - psp in
##D #           \
##D #             psp out
##D #
##D 
##D data <- readAntares(areas="all", links="all")
##D 
##D # Remove pump storage virtual areas
##D 
##D correctedData <- removeVirtualAreas(data, 
##D                                     storageFlexibility = c("psp in", "psp out"),
##D                                     production = "offshore")
## End(Not run)




