library(spatstat)


### Name: MultiStrauss
### Title: The Multitype Strauss Point Process Model
### Aliases: MultiStrauss
### Keywords: spatial models

### ** Examples

   r <- matrix(c(1,2,2,1), nrow=2,ncol=2)
   MultiStrauss(r)
   # prints a sensible description of itself
   r <- 0.03 * matrix(c(1,2,2,1), nrow=2,ncol=2)
   X <- amacrine
   ## Don't show: 
      X <- X[ owin(c(0, 0.8), c(0, 1)) ]
   
## End(Don't show)
   ppm(X ~1, MultiStrauss(r))
   # fit the stationary multitype Strauss process to `amacrine'

   ## Not run: 
##D    ppm(X ~polynom(x,y,3), MultiStrauss(r, c("off","on")))
##D    # fit a nonstationary multitype Strauss process with log-cubic trend
##D    
## End(Not run)



