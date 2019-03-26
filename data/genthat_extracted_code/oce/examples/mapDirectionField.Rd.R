library(oce)


### Name: mapDirectionField
### Title: Add a Direction Field to an Existing Map
### Aliases: mapDirectionField

### ** Examples

## Not run: 
##D library(oce)
##D data(coastlineWorld)
##D par(mar=rep(2, 4))
##D mapPlot(coastlineWorld, longitudelim=c(-120,-55), latitudelim=c(35, 50),
##D         proj="+proj=laea +lat0=40 +lat1=60" +lon_0=-110)
##D lon <- seq(-120, -60, 15)
##D lat <- 45 + seq(-15, 15, 5)
##D lonm <- matrix(expand.grid(lon, lat)[, 1], nrow=length(lon))
##D latm <- matrix(expand.grid(lon, lat)[, 2], nrow=length(lon))
##D ## vectors pointed 45 degrees clockwise from north
##D u <- matrix(1/sqrt(2), nrow=length(lon), ncol=length(lat))
##D v <- matrix(1/sqrt(2), nrow=length(lon), ncol=length(lat))
##D mapDirectionField(lon, lat, u, v, scale=3)
##D mapDirectionField(lonm, latm, 0, 1, scale=3, col='red')
##D # Color code by longitude, using thick lines
##D col <- colormap(lonm)$zcol
##D mapDirectionField(lonm, latm, 1, 0, scale=3, col=col, lwd=2)
## End(Not run)




