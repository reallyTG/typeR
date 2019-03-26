library(spatialprobit)


### Name: kNearestNeighbors
### Title: Build Spatial Weight Matrix from k Nearest Neighbors
### Aliases: kNearestNeighbors

### ** Examples

require(Matrix)
# build spatial weight matrix W from random (x,y) coordinates
W <- kNearestNeighbors(x=rnorm(100), y=rnorm(100), k=6)
image(W, main="spatial weight matrix W")



