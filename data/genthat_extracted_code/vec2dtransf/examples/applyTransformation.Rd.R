library(vec2dtransf)


### Name: applyTransformation
### Title: Apply the transformation to an sp object
### Aliases: applyTransformation applyTransformation-methods
###   applyTransformation,Cartesian2DCoordinateTransformation-method
###   transformCoordinates
### Keywords: spatial

### ** Examples

# From the sp examples:
x <- c(1,1,1,2,2,2,3,3,3)
y <- c(1,2,3,1,2,3,1,2,3)
xy <- cbind(x,y)
S <- SpatialPoints(xy)

st=SimilarityTransformation(parameters=c(1,0,0.2,-0.2))
trS <- applyTransformation(st, S)
trS # Transformed sp object, have a look at the coordinates



