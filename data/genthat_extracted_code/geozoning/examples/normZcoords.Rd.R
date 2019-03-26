library(geozoning)


### Name: normZcoords
### Title: normZcoords
### Aliases: normZcoords

### ** Examples

# Import shape1 object (was read from a shapefile)
shape1 = geozoning::shape1
p = shape1@polygons
P=sp::SpatialPolygons(p) #SpatialPolygons
Z1=list()
for (kk in 1:length(P)){Z1[[kk]]=P[kk]} # transform into list of SpatialPolygons
bd=list(x=c(7723131,7723132,7723294,7723295,7723131),y=c(3576432,3576814,3576809,3576436,3576432))
Z2=normZcoords(Z1,bd)



