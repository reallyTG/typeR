library(GSIF)


### Name: afsp
### Title: Africa Soil Profiles Database
### Aliases: afsp
### Keywords: datasets

### ** Examples

## Not run: 
##D library(rgdal)
##D library(aqp)
##D library(sp)
##D 
##D data(afsp)
##D sites <- afsp$sites
##D coordinates(sites) <- ~ LONWGS84 + LATWGS84
##D proj4string(sites) <- "+proj=longlat +datum=WGS84"
##D ## obtain country borders:
##D library(maps)
##D country.m = map('world', plot=FALSE, fill=TRUE)
##D IDs <- sapply(strsplit(country.m$names, ":"), function(x) x[1])
##D require(maptools)
##D country <- as(map2SpatialPolygons(country.m, IDs=IDs), "SpatialLines")
##D proj4string(country) = "+proj=longlat +datum=WGS84" 
##D ## overlay and plot points and maps:
##D plot(country, col="darkgrey", xlim=c(-25.3,57.8), ylim=c(-34.8, 37.4))
##D points(sites, pch=21, bg="white", cex=.6, col="black")
## End(Not run)



