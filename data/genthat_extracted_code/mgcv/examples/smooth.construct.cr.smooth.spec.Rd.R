library(mgcv)


### Name: smooth.construct.cr.smooth.spec
### Title: Penalized Cubic regression splines in GAMs
### Aliases: smooth.construct.cr.smooth.spec
###   smooth.construct.cs.smooth.spec smooth.construct.cc.smooth.spec
###   cubic.regression.spline cyclic.cubic.spline
### Keywords: models regression

### ** Examples

## cyclic spline example...
  require(mgcv)
  set.seed(6)
  x <- sort(runif(200)*10)
  z <- runif(200)
  f <- sin(x*2*pi/10)+.5
  y <- rpois(exp(f),exp(f)) 

## finished simulating data, now fit model...
  b <- gam(y ~ s(x,bs="cc",k=12) + s(z),family=poisson,
                      knots=list(x=seq(0,10,length=12)))
## or more simply
   b <- gam(y ~ s(x,bs="cc",k=12) + s(z),family=poisson,
                      knots=list(x=c(0,10)))

## plot results...
  par(mfrow=c(2,2))
  plot(x,y);plot(b,select=1,shade=TRUE);lines(x,f-mean(f),col=2)
  plot(b,select=2,shade=TRUE);plot(fitted(b),residuals(b))
  




