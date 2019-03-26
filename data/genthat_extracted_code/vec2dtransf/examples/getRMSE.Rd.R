library(vec2dtransf)


### Name: getRMSE
### Title: Get RMSE
### Aliases: getRMSE getRMSE-methods
###   getRMSE,Cartesian2DCoordinateTransformation-method
### Keywords: regression spatial

### ** Examples

data(control.points)
at <- AffineTransformation(control.points[2:5])
calculateParameters(at)
getRMSE(at) 



