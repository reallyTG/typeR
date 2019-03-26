library(GSIF)


### Name: isis
### Title: ISRIC Soil Information System
### Aliases: isis
### Keywords: datasets

### ** Examples

library(rgdal)
library(sp)

data(isis)
sites <- isis$sites
coordinates(sites) <- ~ LONWGS84 + LATWGS84
proj4string(sites) <- "+proj=longlat +datum=WGS84"
## Not run: 
##D ## obtain country borders:
##D library(maps)
##D country.m = map('world', plot=FALSE, fill=TRUE)
##D IDs <- sapply(strsplit(country.m$names, ":"), function(x) x[1])
##D require(maptools)
##D country <- as(map2SpatialPolygons(country.m, IDs=IDs), "SpatialLines")
##D proj4string(country) = "+proj=longlat +datum=WGS84" 
##D ## overlay and plot points and maps:
##D plot(country, col="darkgrey")
##D points(sites, pch=21, bg="red", cex=.6, col="black")
## End(Not run)



