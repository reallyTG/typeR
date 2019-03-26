library(mgcv)


### Name: sp.vcov
### Title: Extract smoothing parameter estimator covariance matrix from
###   (RE)ML GAM fit
### Aliases: sp.vcov
### Keywords: models smooth regression

### ** Examples
 
require(mgcv)
n <- 100
x <- runif(n);z <- runif(n)
y <- sin(x*2*pi) + rnorm(n)*.2
mod <- gam(y~s(x,bs="cc",k=10)+s(z),knots=list(x=seq(0,1,length=10)),
           method="REML")
sp.vcov(mod)



