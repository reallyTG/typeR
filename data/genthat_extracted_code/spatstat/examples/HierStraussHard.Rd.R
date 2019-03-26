library(spatstat)


### Name: HierStraussHard
### Title: The Hierarchical Strauss Hard Core Point Process Model
### Aliases: HierStraussHard
### Keywords: spatial models

### ** Examples

   r <- matrix(c(30, NA, 40, 30), nrow=2,ncol=2)
   h <- matrix(c(4, NA, 10, 15), 2, 2)
   HierStraussHard(r, h)
   # prints a sensible description of itself
   ppm(ants ~1, HierStraussHard(r, h))
   # fit the stationary hierarchical Strauss-hard core process to ants data



