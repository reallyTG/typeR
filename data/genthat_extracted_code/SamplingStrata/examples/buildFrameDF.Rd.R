library(SamplingStrata)


### Name: buildFrameDF
### Title: Builds the "sampling frame" dataframe from a dataset containing
###   information on all the units in the population of reference
### Aliases: buildFrameDF
### Keywords: survey

### ** Examples

## Not run: 
##D data(swissmunicipalities)
##D id = "Nom"
##D X = c("Surfacesbois","Surfacescult")
##D Y = c("Pop020","Pop2040")
##D domainvalue = "REG"
##D frame <- buildFrameDF(swissmunicipalities,id,X,Y,domainvalue)
##D head(frame)
## End(Not run)



