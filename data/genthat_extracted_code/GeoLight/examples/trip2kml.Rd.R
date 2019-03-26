library(GeoLight)


### Name: trip2kml
### Title: Write a file which plots a trip in Google Earth
### Aliases: trip2kml

### ** Examples

## No test: 
data(hoopoe2)
  hoopoe2$tFirst <- as.POSIXct(hoopoe2$tFirst, tz = "GMT")
  hoopoe2$tSecond <- as.POSIXct(hoopoe2$tSecond, tz = "GMT")
filter <- distanceFilter(hoopoe2,distance=30)
## takes time
## trip2kml("trip.kml", hoopoe2$tFirst[filter], hoopoe2$tSecond[filter], hoopoe2$type[filter],
##		degElevation=-6, col.scheme="heat.colors", cex=0.7,
##		line.col="goldenrod")
## End(No test)



