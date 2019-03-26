library(spatstat)


### Name: HierStrauss
### Title: The Hierarchical Strauss Point Process Model
### Aliases: HierStrauss
### Keywords: spatial models

### ** Examples

   r <- matrix(10 * c(3,4,4,3), nrow=2,ncol=2)
   HierStrauss(r)
   # prints a sensible description of itself
   ppm(ants ~1, HierStrauss(r, , c("Messor", "Cataglyphis")))
   # fit the stationary hierarchical Strauss process to ants data



