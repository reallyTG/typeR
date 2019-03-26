library(expandFunctions)


### Name: coefPlot
### Title: Plots coefficients in an impulse response format
### Aliases: coefPlot

### ** Examples

set.seed(1)
nObs <- 100
X <- distMat(nObs,6)
A <- cbind(c(1,0,-1,rep(0,3))) # Y will only depend on X[,1] and X[,3]
Y <- X %*% A + 0.1*rnorm(nObs)
lassoObj <- easyLASSO(X,Y)
Yhat <- predict(lassoObj,newx=X)
yyHatPlot(Y,Yhat)
coef( lassoObj ) # Sparse coefficients
coefPlot( lassoObj )
coefPlot( lassoObj, includeIntercept=TRUE )
coefPlot( lassoObj, type="b" )



