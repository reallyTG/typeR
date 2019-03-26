library(GSIF)


### Name: landmask
### Title: Global coarse resolution land / soil mask maps
### Aliases: landmask landmask20km
### Keywords: datasets

### ** Examples

library(rgdal)
library(sp)

data(landmask)
gridded(landmask) <- ~x+y
proj4string(landmask) <- "+proj=longlat +datum=WGS84"
## Not run: 
##D  ## plot maps:
##D library(maps)
##D country.m = map('world', plot=FALSE, fill=TRUE)
##D IDs <- sapply(strsplit(country.m$names, ":"), function(x) x[1])
##D library(maptools)
##D country <- as(map2SpatialPolygons(country.m, IDs=IDs), "SpatialLines")
##D spplot(landmask["mask"], col.regions="grey", sp.layout=list("sp.lines", country))
##D spplot(landmask["soilmask"], col.regions="grey", sp.layout=list("sp.lines", country))
## End(Not run)
## also available in the Robinson projection at 20 km grid:
data(landmask20km)
image(landmask20km[1])
summary(landmask20km$suborder)
summary(landmask20km$soilmask)



