library(expandFunctions)


### Name: easyLASSO
### Title: Select and fit sparse linear model with LASSO
### Aliases: easyLASSO

### ** Examples

set.seed(1)
nObs <- 100
X <- distMat(nObs,6)
A <- cbind(c(1,0,-1,rep(0,3)))
  # Y will only depend on X[,1] and X[,3]
Y <- X %*% A + 0.1*rnorm(nObs)
lassoObj <- easyLASSO(X=X,y=Y) # LASSO fitting
Yhat <- predict(lassoObj,newx=X)
yyHatPlot(Y,Yhat)
coef( lassoObj ) # Sparse coefficients
coefPlot( lassoObj )



