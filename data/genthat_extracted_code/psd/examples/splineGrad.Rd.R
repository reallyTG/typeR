library(psd)


### Name: splineGrad
### Title: Numerical derivatives of a series based on its smooth-spline
###   representation
### Aliases: splineGrad splineGrad.default

### ** Examples

## Not run: 
##D #REX
##D library(psd)
##D 
##D ##
##D ## Spline gradient
##D ##
##D 
##D set.seed(1234)
##D x <- seq(0,5*pi,by=pi/64)
##D y <- cos(x) #**2
##D 
##D splineGrad(x, y, TRUE)
##D 
##D # unfortunately, the presence of
##D # noise will affect numerical derivatives
##D y <- y + rnorm(length(y), sd=.1)
##D splineGrad(x, y, TRUE)
##D 
##D # so change the smoothing used in smooth.spline
##D splineGrad(x, y, TRUE, spar=0.2)
##D splineGrad(x, y, TRUE, spar=0.6)
##D splineGrad(x, y, TRUE, spar=1.0)
##D 
## End(Not run)#REX



