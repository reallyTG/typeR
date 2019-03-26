library(SpatialVx)


### Name: FeatureProps
### Title: Single Feature Properties
### Aliases: FeatureProps
### Keywords: math

### ** Examples

data( "ExampleSpatialVxSet" )

x <- ExampleSpatialVxSet$vx

look <- disk2dsmooth(x,5)
u <- quantile(look,0.99)
sIx <- matrix(0, 100, 100)
sIx[ look > u] <- 1
look2 <- disjointer(sIx)[[1]]
look2 <- flipxy(look2)

FeatureProps(look2,
    which.props=c("centroid", "area", "axis"))




