library(geozoning)


### Name: voronoiPolygons
### Title: voronoiPolygons
### Aliases: voronoiPolygons

### ** Examples

## No test: 
 data(mapTest)
 rx=range(mapTest$krigData$x)
 ry=range(mapTest$krigData$y)
 nx=nrow(mapTest$krigGrid)
 ny=ncol(mapTest$krigGrid)
 nB=matrix(logical((nx*ny)^2),nx*ny,nx*ny) # big matrix
 vP=voronoiPolygons(mapTest$krigData,c(rx,ry),nB)
 length(vP$surfVoronoi) #as many as kriged data points
## End(No test)



