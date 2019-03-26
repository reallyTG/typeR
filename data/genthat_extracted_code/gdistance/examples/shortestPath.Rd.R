library(gdistance)


### Name: shortestPath
### Title: Shortest path
### Aliases: shortestPath shortestPath,TransitionLayer,Coords,Coords-method
### Keywords: spatial

### ** Examples

#example equivalent to that in the documentation on r.cost/r.drain in GRASS
r <- raster(nrows=6, ncols=7, xmn=0, xmx=7, ymn=0, ymx=6, crs="+proj=utm +units=m")
 
r[] <- c(2, 2, 1, 1, 5, 5, 5,
         2, 2, 8, 8, 5, 2, 1,
         7, 1, 1, 8, 2, 2, 2,
         8, 7, 8, 8, 8, 8, 5,
         8, 8, 1, 1, 5, 3, 9,
         8, 1, 1, 2, 5, 3, 9)

T <- transition(r, function(x) 1/mean(x), 8) 
# 1/mean: reciprocal to get permeability
T <- geoCorrection(T)

c1 <- c(5.5,1.5) 
c2 <- c(1.5,5.5)

#make a SpatialLines object for visualization
sPath1 <- shortestPath(T, c1, c2, output="SpatialLines")
plot(r)
lines(sPath1)

#make a TransitionLayer for further calculations
sPath2 <- shortestPath(T, c1, c2)
plot(raster(sPath2))



