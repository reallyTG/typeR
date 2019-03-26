library(mgcv)


### Name: model.matrix.gam
### Title: Extract model matrix from GAM fit
### Aliases: model.matrix.gam
### Keywords: models smooth regression

### ** Examples
 
require(mgcv)
n <- 15
x <- runif(n)
y <- sin(x*2*pi) + rnorm(n)*.2
mod <- gam(y~s(x,bs="cc",k=6),knots=list(x=seq(0,1,length=6)))
model.matrix(mod)



