library(chebpol)


### Name: ucappx
### Title: Interpolation on a uniform grid
### Aliases: ucappx ucappxf
### Keywords: internal

### ** Examples


## Not run: 
##D # Runge function
##D f <- function(x) 1/(1+25*x^2)
##D grid <- seq(-1,1,length.out=15)
##D val <- f(grid)
##D uc <- Vectorize(ucappx(val))
##D # and the Chebyshev
##D ch <- Vectorize(chebappxf(f,15))
##D # test it at 10 random points
##D t(replicate(10,{a<-runif(1,-1,1); c(arg=a, uc=uc(a), true=f(a), cheb=ch(a))}))
## End(Not run)



