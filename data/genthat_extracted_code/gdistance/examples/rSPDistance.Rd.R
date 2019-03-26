library(gdistance)


### Name: rSPDistance
### Title: Randomized shortest path distance
### Aliases: ' rSPDistance ' rSPDistance,TransitionLayer,Coords-method
### Keywords: spatial

### ** Examples

#Create a new raster and set all its values to unity.
r <- raster(nrows=18, ncols=36) 
r <- setValues(r,rep(1,ncell(raster)))

#Create a Transition object from the raster
tr <- transition(r,mean,4)

#Create two sets of coordinates
sP1 <- SpatialPoints(cbind(c(65,5,-65),c(55,35,-35)))
sP2 <- SpatialPoints(cbind(c(50,15,-40),c(80,20,-5)))

#Calculate the RSP distance between the points
rSPDistance(tr, sP1, sP2, 1)




