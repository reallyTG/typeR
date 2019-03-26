library(oce)


### Name: mapTissot
### Title: Add Tissot Indicatrices to a Map
### Aliases: mapTissot

### ** Examples

## Not run: 
##D library(oce)
##D data(coastlineWorld)
##D par(mfrow=c(1, 1), mar=c(2, 2, 1, 1))
##D p  <- "+proj=aea +lat_1=10 +lat_2=60 +lon_0=-45"
##D mapPlot(coastlineWorld, projection=p, col="gray",
##D longitudelim=c(-90,0), latitudelim=c(0, 50))
##D mapTissot(c(15, 15), col='red')
## End(Not run)



