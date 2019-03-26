library(SoDA)


### Name: trackSpeed
### Title: Compute interpoint speeds along a track
### Aliases: trackSpeed
### Keywords: math

### ** Examples

## Don't show: 
load(system.file("testdata/gpsObject1.rda", package = "SoDA"))
object <- gpsObject1
## End(Don't show)
xy <- geoXY(object@latitude, object@longitude)
trackSpeed(cbind(xy, object@elevation), object@time)
## Don't show: 
rm(gpsObject1, object, xy)
## End(Don't show)



