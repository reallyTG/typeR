library(oce)


### Name: mapCoordinateSystem
### Title: Draw a coordinate system
### Aliases: mapCoordinateSystem

### ** Examples

## Not run: 
##D library(oce)
##D data(coastlineWorldFine, package='ocedata')
##D HfxLon <- -63.5752
##D HfxLat <- 44.6488
##D mapPlot(coastlineWorldFine, proj='+proj=merc',
##D         longitudelim=HfxLon+c(-2,2), latitudelim=HfxLat+c(-2,2),
##D         col='lightgrey')
##D mapCoordinateSystem(HfxLon, HfxLat, phi=45, length=0.05)
## End(Not run)



