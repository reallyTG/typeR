library(ibs)


### Name: ibs
### Title: Integratal of a B-spline function
### Aliases: ibs
### Keywords: math

### ** Examples

kns <- c(rep(0,4),1:4*0.2,rep(1,4))
co <- rnorm(length(kns)-3)
integrate(bspline,knots=kns,ord=3,coef=co,0,0.95)
integrate(function(x)bsbases(x,kns,3) %*% co,0,0.95)
ibs(0.95,kns,3,co)



