library(pRoloc)


### Name: checkFvarOverlap
### Title: Compare a feature variable overlap
### Aliases: checkFvarOverlap

### ** Examples

library("pRolocdata")
data(dunkley2006)
res <- checkFvarOverlap(dunkley2006, dunkley2006,
                        "markers", "markers.orig")
str(res)



