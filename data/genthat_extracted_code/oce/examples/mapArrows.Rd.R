library(oce)


### Name: mapArrows
### Title: Add Arrows to a Map
### Aliases: mapArrows

### ** Examples

## Not run: 
##D library(oce)
##D data(coastlineWorld)
##D mapPlot(coastlineWorld, longitudelim=c(-120, -60), latitudelim=c(30, 60),
##D         col="lightgray", projection="+proj=lcc +lon_0=-100")
##D lon <- seq(-120, -75, 15)
##D n <- length(lon)
##D lat <- 45 + rep(0, n)
##D # Draw meridional arrows in N America, from 45N to 60N.
##D mapArrows(lon, lat, lon, lat+15, length=0.05, col="blue")
## End(Not run)




