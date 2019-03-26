library(oce)


### Name: mapText
### Title: Add Text to a Map
### Aliases: mapText

### ** Examples

## Not run: 
##D library(oce)
##D data(coastlineWorld)
##D longitude <- coastlineWorld[['longitude']]
##D latitude <- coastlineWorld[['latitude']]
##D mapPlot(longitude, latitude, type='l', grid=5,
##D         longitudelim=c(-70,-50), latitudelim=c(45, 50),
##D         projection="+proj=merc")
##D lon <- -63.5744 # Halifax
##D lat <- 44.6479
##D mapPoints(lon, lat, pch=20, col="red")
##D mapText(lon, lat, "Halifax", col="red", pos=1, offset=1)
## End(Not run)



