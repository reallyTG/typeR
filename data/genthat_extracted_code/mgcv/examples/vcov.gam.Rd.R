library(mgcv)


### Name: vcov.gam
### Title: Extract parameter (estimator) covariance matrix from GAM fit
### Aliases: vcov.gam
### Keywords: models smooth regression

### ** Examples
 
require(mgcv)
n <- 100
x <- runif(n)
y <- sin(x*2*pi) + rnorm(n)*.2
mod <- gam(y~s(x,bs="cc",k=10),knots=list(x=seq(0,1,length=10)))
diag(vcov(mod))



