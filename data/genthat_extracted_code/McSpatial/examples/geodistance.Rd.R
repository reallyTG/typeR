library(McSpatial)


### Name: geodistance
### Title: Calculates distances using the great circle formula
### Aliases: geodistance
### Keywords: Distance Great-Circle Distance Formula

### ** Examples

data(cookdata)
dcbd <- geodistance(cookdata$LONGITUDE, cookdata$LATITUDE, -87.627800, 41.881998)$dist



