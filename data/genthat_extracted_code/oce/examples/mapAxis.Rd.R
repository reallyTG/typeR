library(oce)


### Name: mapAxis
### Title: Add Axis Labels to an Existing Map
### Aliases: mapAxis

### ** Examples

## Not run: 
##D library(oce)
##D data(coastlineWorld)
##D par(mar=c(2, 2, 3, 1))
##D lonlim <- c(-180, 180)
##D latlim <- c(60, 120)
##D mapPlot(coastlineWorld, projection="+proj=stere +lat_0=90",
##D         longitudelim=lonlim, latitudelim=latlim,
##D         grid=FALSE)
##D mapGrid(15, 15, polarCircle=1/2)
##D mapAxis()
## End(Not run)




