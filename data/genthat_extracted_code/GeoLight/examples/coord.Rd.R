library(GeoLight)


### Name: coord
### Title: Simple Threshold Geolocation Estimates
### Aliases: coord

### ** Examples

data(hoopoe2)
  hoopoe2$tFirst <- as.POSIXct(hoopoe2$tFirst, tz = "GMT")
  hoopoe2$tSecond <- as.POSIXct(hoopoe2$tSecond, tz = "GMT")
crds <- coord(hoopoe2, degElevation=-6, tol = 0.2)
## tripMap(crds, xlim=c(-20,20), ylim=c(5,50), main="hoopoe2")



