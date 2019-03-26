library(chebpol)


### Name: chebpol-package
### Title: Methods for creating multivariate interpolations on hypercubes
### Aliases: chebpol-package chebpol
### Keywords: Chebyshev DCT Floater-Hormann interpolation

### ** Examples


## make some function values on a 50x50x50 grid
dims <- c(x=50,y=50,z=50)
f <- function(x) sqrt(1+x[1])*exp(x[2])*sin(5*x[3])^2
value <- evalongrid(f , dims)
##fit a Chebyshev approximation to it. Note that the value-array contains the
##grid-structure. 
ch <- ipol(value,method='cheb')
## To see the full grid, use the chebknots function and expand.grid
## Not run: 
##D head(cbind(expand.grid(chebknots(dims)), value=as.numeric(value),
##D       appx=as.numeric(evalongrid(ch,dims))))
## End(Not run)
## Make a Floater-Hormann approximation on a uniform grid as well
fh <- ipol(f,grid=lapply(dims,function(n) seq(-1,1,length.out=n)),method='fh',k=5)
## evaluate in some random points in R3
m <- matrix(runif(15,-1,1),3)
rbind(true=apply(m,2,f), cheb=ch(m), fh=fh(m))




