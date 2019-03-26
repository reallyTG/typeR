library(vec2dtransf)


### Name: getParameters
### Title: Get tranformation parameters
### Aliases: getParameters getParameters-methods
###   getParameters,Cartesian2DCoordinateTransformation-method
### Keywords: spatial

### ** Examples

# From parameters, similarity transformation
st <- SimilarityTransformation(parameters=c(1,2,3,4))
getParameters(st)

# From parameters, affine transformation
at <- AffineTransformation(parameters=c(1,2,3,4,5,6))
getParameters(at)

# From control points, affine transformation
data(control.points)
at2 <- AffineTransformation(control.points[2:5])
getParameters(at2) # Still unknown parameters
calculateParameters(at2)
getParameters(at2) 



