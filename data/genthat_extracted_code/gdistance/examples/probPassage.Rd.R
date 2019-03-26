library(gdistance)


### Name: passage
### Title: Probability of passage
### Aliases: passage passage,TransitionLayer,Coords,Coords,missing-method
###   passage,TransitionLayer,Coords,Coords,numeric-method
###   passage,TransitionLayer,RasterLayer,RasterLayer,missing-method
###   passage,TransitionLayer,RasterLayer,RasterLayer,numeric-method
### Keywords: spatial

### ** Examples

#create a new raster and set all its values to unity.
raster <- raster(nrows=18, ncols=36) 
raster <- setValues(raster,rep(1,ncell(raster)))

#create a Transition object from the raster
tr <- transition(raster,mean,4)
trC <- geoCorrection(tr, type="c", scl=TRUE)
trR <- geoCorrection(tr, type="r", scl=TRUE)

#create two coordinates
sP1 <- SpatialPoints(cbind(-105,55))
sP2 <- SpatialPoints(cbind(105,-55))

#randomised shortest paths with theta = 2
rSPraster <- passage(trC, sP1, sP2, 2)
plot(rSPraster)
points(sP1)
points(sP2)

#randomised shortest paths with theta = 0.05
rSPraster <- passage(trC, sP1, sP2, 0.05)
plot(rSPraster) 
points(sP1)
points(sP2)

#randomised shortest paths with theta = 0.05
#and total
rSPraster <- passage(trC, sP1, sP2, 0.05, totalNet = "total")
plot(rSPraster) 
points(sP1)
points(sP2)

#random walk
rwraster <- passage(trR, sP1, sP2)
plot(rwraster)
points(sP1)
points(sP2)
  


