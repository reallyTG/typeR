library(ocedata)


### Name: topo2
### Title: World topography data, on a 2-degree grid.
### Aliases: topo2
### Keywords: datasets

### ** Examples

## Not run: 
##D # Compare with topoWorld in oce
##D library("oce")
##D data(topoWorld, package="oce")
##D w <- topoWorld
##D contour(w[['longitude']], w[['latitude']], w[['z']], level=0, drawlabels=FALSE)
##D data(topo2, package="ocedata")
##D lon <- seq(-179.5, 178.5, by=2)
##D lat <- seq(-89.5, 88.5, by=2)
##D contour(lon, lat, topo2, level=0, add=TRUE, col='red', lty='dotted', drawlabels=FALSE)
## End(Not run)



