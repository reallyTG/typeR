library(chebpol)


### Name: chebappx
### Title: Chebyshev interpolation on a hypercube
### Aliases: chebappx chebappxf
### Keywords: internal

### ** Examples

## Not run: 
##D 
##D f <- function(x) exp(-sum(x^2))
##D ## we want 3 dimensions, i.e. something like
##D ## f(x,y,z) = exp(-(x^2 + y^2 + z^2))
##D ## 8 points in each dimension
##D gridsize <- list(8,8,8)
##D # get the function values on the Chebyshev grid
##D values <- evalongrid(f,gridsize)
##D # make an approximation
##D ch <- chebappx(values)
##D ## test it:
##D a <- runif(3,-1,1);ch(a)-f(a)
##D 
##D ## then one with domain [0.1,0.3] x [-1,-0.5] x [0.5,2]
##D intervals <- list(c(0.1,0.3),c(-1,-0.5),c(0.5,2))
##D # evaluate on the grid
##D values <- evalongrid(f,gridsize,intervals)
##D # make an approximation
##D ch2 <- chebappx(values,intervals)
##D a <- c(0.25,-0.68,1.43); ch2(a)-f(a)
##D # outside of domain:
##D a <- runif(3) ; ch2(a); f(a)
##D 
##D # Make a function on [0,2] x [0,1]
##D f <- function(y) uniroot(function(x) x-y[[1]]*cos(pi*x^2),lower=0,upper=1)$root*sum(y^2)
##D # approximate it
##D ch <- chebappxf(f,c(12,12),intervals=list(c(0,2),c(0,1)))
##D # test it:
##D a <- c(runif(1,0,2),runif(1,0,1)); ch(a); f(a)
##D 
##D # Lambert's W:
##D f <- function(y) uniroot(function(x) y - x*exp(x), lower=-1,upper=3)$root
##D W <- chebappxf(f,100,c(-exp(-1),3*exp(3)))
##D W(10*pi)*exp(W(10*pi))/pi
## End(Not run)



