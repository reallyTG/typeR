library(SpatialExtremes)


### Name: wind
### Title: Annual maxima wind gusts in the Netherlands.
### Aliases: wind
### Keywords: datasets

### ** Examples

require(maps)
data(wind)
par(mar = rep(0, 4))
maps::map(xlim = c(0, 9), ylim = c(47.5, 57.5))
points(coord[,1:2], pch = 15)



