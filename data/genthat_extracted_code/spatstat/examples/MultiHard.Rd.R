library(spatstat)


### Name: MultiHard
### Title: The Multitype Hard Core Point Process Model
### Aliases: MultiHard
### Keywords: spatial models

### ** Examples

   h <- matrix(c(1,2,2,1), nrow=2,ncol=2)

   # prints a sensible description of itself
   MultiHard(h)

   # Fit the stationary multitype hardcore process to `amacrine'
   # with hard core operating only between cells of the same type.
   h <- 0.02 * matrix(c(1, NA, NA, 1), nrow=2,ncol=2)
   ppm(amacrine ~1, MultiHard(h))



