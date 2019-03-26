library(pRoloc)


### Name: fDataToUnknown
### Title: Update a feature variable
### Aliases: fDataToUnknown

### ** Examples

library("pRolocdata")
data(dunkley2006)
getMarkers(dunkley2006, "markers")
dunkley2006 <- fDataToUnknown(dunkley2006,
                              from = "unknown", to = "unassigned")
getMarkers(dunkley2006, "markers")



