library(move)


### Name: brownian.bridge.dyn
### Title: Calculates a dynamic Brownian Bridge
### Aliases: brownian.bridge.dyn
###   brownian.bridge.dyn,.MoveTrackSingle,RasterLayer,missing,numeric-method
###   brownian.bridge.dyn,MoveStack,RasterLayer,missing,numeric-method
###   brownian.bridge.dyn,.MoveTrackSingle,missing,missing,numeric-method
###   brownian.bridge.dyn,SpatialPointsDataFrame,missing,numeric,ANY-method
###   brownian.bridge.dyn,SpatialPointsDataFrame,numeric,missing,ANY-method
###   brownian.bridge.dyn,dBMvariance,RasterLayer,missing,numeric-method
###   brownian.bridge.dyn,dBMvarianceStack,RasterLayer,missing,numeric-method
###   brownian.bridge.dyn,dBMvarianceBurst,RasterLayer,missing,numeric-method
###   brownian.bridge.dyn,ANY,RasterLayer,missing,character-method

### ** Examples

## create a move object
data(leroy)
## change projection method to aeqd and center the coordinate system to the track
data2 <- spTransform(leroy[30:90,], CRSobj="+proj=aeqd +ellps=WGS84", center=TRUE)

## create a DBBMM object
dbbmm <- brownian.bridge.dyn(object=data2, location.error=12, dimSize=125, ext=.45, 
			     time.step=2, margin=15)

plot(dbbmm)

## Don't show: 
data(ricky)
  leroy <- leroy[1:50]
  ricky <- ricky[1:50]
  stack <- moveStack(list(leroy,ricky))
  t <- brownian.bridge.dyn(spTransform(stack, center=TRUE), location.error=23.5, dimSize=1125, 
			   time.step=6, ext=1.2)
## End(Don't show)



