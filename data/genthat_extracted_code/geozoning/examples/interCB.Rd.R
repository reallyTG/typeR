library(geozoning)


### Name: interCB
### Title: interCB
### Aliases: interCB
### Keywords: internal

### ** Examples

data(mapTest)
pG=polyToSp2(sp::Polygon(mapTest$boundary)) #SpatialPolygons corresponding to map boundary
cL=contourAuto(list(),mapTest$step,mapTest$xsize,mapTest$ysize,
   mapTest$krigGrid,c(5,7),mapTest$boundary)
ps = geozoning:::interCB(cL[[8]],mapTest$step,mapTest$boundary,pG)#envelope is the whole map
sp::plot(pG)
sp::plot(ps,col="red",add=TRUE)



