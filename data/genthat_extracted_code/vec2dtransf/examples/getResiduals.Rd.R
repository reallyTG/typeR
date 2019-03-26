library(vec2dtransf)


### Name: getResiduals
### Title: Get residuals
### Aliases: getResiduals getResiduals-methods
###   getResiduals,Cartesian2DCoordinateTransformation-method
### Keywords: regression spatial

### ** Examples

data(control.points)
at <- AffineTransformation(control.points[2:5])
calculateParameters(at)
getResiduals(at) 



