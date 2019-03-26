library(oce)


### Name: plot,coastline-method
### Title: Plot a Coastline
### Aliases: plot,coastline-method plot.coastline

### ** Examples

## Not run: 
##D library(oce)
##D par(mar=c(2, 2, 1, 1))
##D data(coastlineWorld)
##D plot(coastlineWorld)
##D plot(coastlineWorld, clongitude=-63.6, clatitude=44.6, span=1000)
##D 
##D ## Canada in Lambert projection
##D plot(coastlineWorld, clongitude=-95, clatitude=65, span=5500,
##D      grid=10, projection='+proj=laea +lon_0=-100 +lat_0=55')
## End(Not run)




