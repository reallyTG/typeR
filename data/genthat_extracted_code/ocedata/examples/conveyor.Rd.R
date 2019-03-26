library(ocedata)


### Name: conveyor
### Title: Conveyor-belt path
### Aliases: conveyor
### Keywords: datasets

### ** Examples

## Not run: 
##D library(oce)
##D data(coastlineWorld)
##D par(mar=rep(1,4))
##D mapPlot(coastlineCut(coastlineWorld,70), projection="+proj=wintri +lon_0=70")
##D data(conveyor, package="ocedata")
##D ## Main path
##D lon <- subset(conveyor, path==1)$longitude
##D lat <- subset(conveyor, path==1)$latitude
##D mapLines(lon, lat, col="blue", lwd=3)
##D ## Secondary path (in Indian Ocean)
##D lon <- subset(conveyor, path==2)$longitude
##D lat <- subset(conveyor, path==2)$latitude
##D mapLines(lon, lat, col="darkgreen", lwd=3)
## End(Not run)



