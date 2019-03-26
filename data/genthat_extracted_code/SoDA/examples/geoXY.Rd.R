library(SoDA)


### Name: geoXY
### Title: Geodetic coordinates from latitude and longitude
### Aliases: geoXY
### Keywords: math

### ** Examples

## Don't show: 
load(system.file("testdata/gpsObject1.rda", package = "SoDA"))
## End(Don't show)
xy <- geoXY(gpsObject1@latitude, gpsObject1@longitude, unit = 1000)
plot(xy[,1], xy[,2], asp = 1)
## Don't show: 
rm(gpsObject1, xy)
## End(Don't show)



