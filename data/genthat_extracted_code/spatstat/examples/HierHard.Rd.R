library(spatstat)


### Name: HierHard
### Title: The Hierarchical Hard Core Point Process Model
### Aliases: HierHard
### Keywords: spatial models

### ** Examples

   h <- matrix(c(4, NA, 10, 15), 2, 2)
   HierHard(h)
   # prints a sensible description of itself
   ppm(ants ~1, HierHard(h))
   # fit the stationary hierarchical hard core process to ants data



