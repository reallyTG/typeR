library(pRoloc)


### Name: testMSnSet
### Title: Create a stratified 'test' 'MSnSet'
### Aliases: testMSnSet

### ** Examples

library(pRolocdata)
data(tan2009r1)
sample <- testMSnSet(tan2009r1)
getMarkers(sample, "test")
all(dim(sample) == dim(markerMSnSet(tan2009r1)))



