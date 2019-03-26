library(pRoloc)


### Name: getMarkerClasses
### Title: Returns the organelle classes in an 'MSnSet'
### Aliases: getMarkerClasses

### ** Examples

library("pRolocdata")
data(dunkley2006)
organelles <- getMarkerClasses(dunkley2006)
## same if markers encoded as a matrix
dunkley2006 <- mrkVecToMat(dunkley2006, mfcol = "Markers")
organelles2 <- getMarkerClasses(dunkley2006, fcol = "Markers")
stopifnot(all.equal(organelles, organelles2))



