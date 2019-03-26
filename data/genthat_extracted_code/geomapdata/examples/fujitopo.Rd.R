library(geomapdata)


### Name: fujitopo
### Title: Topographic DEM of Japan
### Aliases: fujitopo
### Keywords: datasets

### ** Examples



## Not run: 
##D library(GEOmap)
##D data(fujitopo)
##D data(japmap)
##D 
##D PLOC=list(LON=range(fujitopo$lon), x=range(fujitopo$lon), LAT=range(fujitopo$lat), y=range(fujitopo$lat))
##D 
##D 
##D ####   with projectionplotGEOmap(japmap, add=FALSE)
##D 
##D PROJ = setPROJ(type=2, LAT0=mean(PLOC$y) , LON0=mean(PLOC$x) )
##D 
##D plotGEOmapXY(japmap, PROJ=PROJ, LIM=c(min(PLOC$LON), min(PLOC$LAT),
##D max(PLOC$LON), max(PLOC$LAT)), add=FALSE)
##D 
##D xy = GLOB.XY(fujitopo$lat, fujitopo$lon, PROJ)
##D 
##D 
##D points(xy$x, xy$y, pch=".", col="pink")
##D 
##D 
##D 
##D 
## End(Not run)







