library(vec2dtransf)


### Name: plotGridTransformation
### Title: Plot grid transformation
### Aliases: plotGridTransformation plotGridTransformation-methods
###   plotGridTransformation,Cartesian2DCoordinateTransformation-method
### Keywords: spatial

### ** Examples

# From the sp examples:
x <- c(1,1,1,2,2,2,3,3,3)
y <- c(1,2,3,1,2,3,1,2,3)
xy <- cbind(x,y)
S <- SpatialPoints(xy)

st=SimilarityTransformation(parameters=c(1,0,0.2,-0.2))
plotGridTransformation(st, bbox(S), 25)



