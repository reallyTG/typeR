library(vec2dtransf)


### Name: calculateParameters
### Title: Calculate parameters
### Aliases: calculateParameters calculateParameters-methods
###   calculateParameters,AffineTransformation-method
###   calculateParameters,SimilarityTransformation-method
### Keywords: regression spatial

### ** Examples

data(control.points)
at <- AffineTransformation(control.points[2:5])
getParameters(at) # Still unknown 
calculateParameters(at)
getParameters(at) # Now there are parameters!



