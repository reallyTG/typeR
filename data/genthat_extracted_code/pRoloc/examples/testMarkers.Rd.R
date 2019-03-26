library(pRoloc)


### Name: testMarkers
### Title: Tests marker class sizes
### Aliases: testMarkers

### ** Examples

library("pRolocdata")
data(dunkley2006)
getMarkers(dunkley2006)
testMarkers(dunkley2006)
toosmall <- testMarkers(dunkley2006, xval = 15)
toosmall
try(testMarkers(dunkley2006, xval = 15, error = TRUE))



