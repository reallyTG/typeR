library(conicfit)


### Name: Residuals.ellipse
### Title: Projecting a given set of points onto an ellipse
### Aliases: Residuals.ellipse
### Keywords: datasets

### ** Examples

XY <- matrix(c(1,7,2,6,5,8,7,7,9,5,3,7,6,2,8,4),8,2,byrow=TRUE)
ParG <- matrix(c(0,0,2,1,0),ncol=1)
Residuals.ellipse(XY,ParG)


