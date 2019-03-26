library(conicfit)


### Name: fit.ellipseLMG
### Title: Fitting an ellipse using Implicit method
### Aliases: fit.ellipseLMG fit.ellipseLMG.H
### Keywords: datasets

### ** Examples

XY <- matrix(c(1,7,2,6,5,8,7,7,9,5,3,7,6,2,8,4),8,2,byrow=TRUE)
ParGini <- matrix(c(0,0,2,1,0),ncol=1)
LambdaIni=0.1
fit.ellipseLMG(XY,ParGini,LambdaIni)



