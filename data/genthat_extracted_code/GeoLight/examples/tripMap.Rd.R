library(GeoLight)


### Name: tripMap
### Title: Draw the positions and the trip on a map
### Aliases: tripMap

### ** Examples

data(hoopoe2)
 hoopoe2$tFirst <- as.POSIXct(hoopoe2$tFirst, tz = "GMT")
 hoopoe2$tSecond <- as.POSIXct(hoopoe2$tSecond, tz = "GMT")
crds <- coord(hoopoe2, degElevation = -6)
tripMap(crds, xlim = c(-20,20), ylim = c(0,60), main="hoopoe2")



