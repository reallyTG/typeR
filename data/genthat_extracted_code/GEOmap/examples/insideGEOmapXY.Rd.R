library(GEOmap)


### Name: insideGEOmapXY
### Title: Get LAT-LON points that fall inside a map
### Aliases: insideGEOmapXY
### Keywords: misc

### ** Examples


## Not run: 
##D 
##D data('japmap', package='geomapdata' )
##D isel1 = which( japmap$STROKES$code != "i" & japmap$STROKES$num>120 )
##D 
##D  PROJfuji = setPROJ(type = 2, LAT0=35.358,LON0=138.731)
##D plotGEOmapXY(japmap, PROJ=PROJfuji, SEL=isel1 , add=FALSE)
##D pointsGEOmapXY(gvol$lat, gvol$lon,  PROJ=PROJfuji)
##D textGEOmapXY(gvol$lat, gvol$lon, gvol$name,  PROJ=PROJfuji, pos=4,
##D cex=.5)
##D wv =insideGEOmapXY(gvol$lat, gvol$lon, PROJfuji)
##D cbind(gvol$name[wv], gvol$lat[wv], gvol$lon[wv])
##D 
##D 
## End(Not run)







