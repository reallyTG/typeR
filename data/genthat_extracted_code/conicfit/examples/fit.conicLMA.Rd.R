library(conicfit)


### Name: fit.conicLMA
### Title: Fitting a conic to a given set of points (Implicit method)
### Aliases: fit.conicLMA
### Keywords: datasets

### ** Examples

XY <- matrix(c(1,7,2,6,5,8,7,7,9,5,3,7,6,2,8,4),8,2,byrow=TRUE)
ParAini <- matrix(c(0.2500,0, 1.0000, 0, 0, -1.0000),ncol=1)
LambdaIni=0.1
fit.conicLMA(XY,ParAini,LambdaIni)



