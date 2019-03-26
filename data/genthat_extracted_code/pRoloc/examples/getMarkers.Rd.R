library(pRoloc)


### Name: getMarkers
### Title: Get the organelle markers in an 'MSnSet'
### Aliases: getMarkers

### ** Examples

library("pRolocdata")
data(dunkley2006)
## marker vectors
myVmarkers <- getMarkers(dunkley2006)
head(myVmarkers)
## marker matrix
dunkley2006 <- mrkVecToMat(dunkley2006, mfcol = "Markers")
myMmarkers <- getMarkers(dunkley2006, fcol = "Markers")
head(myMmarkers)



