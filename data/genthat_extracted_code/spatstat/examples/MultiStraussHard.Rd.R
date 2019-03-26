library(spatstat)


### Name: MultiStraussHard
### Title: The Multitype/Hard Core Strauss Point Process Model
### Aliases: MultiStraussHard
### Keywords: spatial models

### ** Examples

   r <- matrix(3, nrow=2,ncol=2)
   h <- matrix(c(1,2,2,1), nrow=2,ncol=2)
   MultiStraussHard(r,h)
   # prints a sensible description of itself
   r <- 0.04 * matrix(c(1,2,2,1), nrow=2,ncol=2)
   h <- 0.02 * matrix(c(1,NA,NA,1), nrow=2,ncol=2)
   X <- amacrine
   ## Don't show: 
       X <- X[owin(c(0,0.8), c(0,1))]
   
## End(Don't show)
   fit <- ppm(X ~1, MultiStraussHard(r,h))
   # fit stationary multitype hardcore Strauss process to `amacrine'



