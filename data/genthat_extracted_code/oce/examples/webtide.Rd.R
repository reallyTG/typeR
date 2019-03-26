library(oce)


### Name: webtide
### Title: Get a Tidal Prediction from a WebTide Database
### Aliases: webtide

### ** Examples

## Not run: 
##D ## needs WebTide at the system level
##D library(oce)
##D ## 1. prediction at Halifax NS
##D longitude <- -63.57
##D latitude <- 44.65
##D prediction <- webtide("predict", longitude=longitude, latitude=latitude)
##D mtext(sprintf("prediction at %fN %fE", latitude, longitude), line=0.75, side=3)
##D ## 2. map
##D webtide(lon=-63.57,lat=44.65,xlim=c(-64,-63),ylim=c(43.0,46))
## End(Not run)



