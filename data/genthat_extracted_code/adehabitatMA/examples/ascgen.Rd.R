library(adehabitatMA)


### Name: ascgen
### Title: Making Raster Maps From SpatialPoints Objects
### Aliases: ascgen
### Keywords: spatial

### ** Examples


## generates a random sample of points
xy <- matrix(runif(1000), ncol=2)

## coerce them to SpatialPoints
xy <- SpatialPoints(xy)
plot(xy)

## generate a SpatialPixelsDataFrame
## (and count the number of points)
spd <- ascgen(xy, cellsize=0.1)
image(spd)





