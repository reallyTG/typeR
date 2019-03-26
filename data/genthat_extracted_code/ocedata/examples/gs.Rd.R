library(ocedata)


### Name: gs
### Title: Gulf Stream position
### Aliases: gs
### Keywords: datasets

### ** Examples

## Not run: 
##D library(oce)
##D data(gs, package="ocedata")
##D data(coastlineWorldMedium, package="ocedata")
##D plot(coastlineWorldMedium,
##D      clon=mean(gs$longitude), clat=mean(gs$latitude), span=3200)
##D data(topoWorld)
##D contour(topoWorld[["longitude"]]-360, 
##D         topoWorld[["latitude"]], -topoWorld[["z"]],
##D         level=1000*(1:5), col='brown', add=TRUE)
##D for (i in gs$month)
##D     lines(gs$longitude, gs$latitude[,i], col='blue')
## End(Not run)



