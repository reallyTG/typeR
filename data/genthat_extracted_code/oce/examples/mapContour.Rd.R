library(oce)


### Name: mapContour
### Title: Add Contours on a Existing map
### Aliases: mapContour

### ** Examples

## Not run: 
##D library(oce)
##D data(coastlineWorld)
##D par(mar=rep(1, 4))
##D ## Arctic 100m, 2km, 3km isobaths, showing shelves and ridges.
##D mapPlot(coastlineWorld, latitudelim=c(60, 120), longitudelim=c(-130,-50),
##D         projection="+proj=stere +lat_0=90")
##D data(topoWorld)
##D lon <- topoWorld[['longitude']]
##D lat <- topoWorld[['latitude']]
##D z <- topoWorld[['z']]
##D mapContour(lon, lat, z, levels=c(-100, -2000, -3000), col=1:3, lwd=2)
## End(Not run)



