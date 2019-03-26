library(spatstat)


### Name: with.hyperframe
### Title: Evaluate an Expression in Each Row of a Hyperframe
### Aliases: with.hyperframe
### Keywords: spatial manip programming

### ** Examples

  # generate Poisson point patterns with intensities 10 to 100
   H <- hyperframe(L=seq(10,100, by=10))
   X <- with(H, rpoispp(L))



