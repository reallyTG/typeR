library(SpatialVx)


### Name: ExampleSpatialVxSet
### Title: Simulated Spatial Verification Set
### Aliases: ExampleSpatialVxSet
### Keywords: datasets

### ** Examples

data( "ExampleSpatialVxSet" )
x <- ExampleSpatialVxSet$vx
xhat <- ExampleSpatialVxSet$fcst
par(mfrow=c(1,2))
image.plot(x, col=c("gray",tim.colors(64)))
image.plot(xhat, col=c("gray",tim.colors(64)))



