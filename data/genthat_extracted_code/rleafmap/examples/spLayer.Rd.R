library(rleafmap)


### Name: spLayer
### Title: Define a Data Layer
### Aliases: spLayer

### ** Examples

## Not run: 
##D  #POINTS
##D  data(velov)
##D  vv <- spLayer(velov, stroke=F, popup=velov$NAME)
##D 
##D  #POLYGONS
##D  data(campsites)
##D  gcol <- rev(heat.colors(5))
##D  gcut <- cut(mapdep$N.CAMPSITES, breaks=c(-1, 20, 40, 60, 80, 1000))
##D  cs <- spLayer(campsites, fill.col=as.numeric(gcut))
##D  bm1 <- basemap("mapquest.map")
##D 
##D  writeMap(bm1, cs, vv)
## End(Not run)



