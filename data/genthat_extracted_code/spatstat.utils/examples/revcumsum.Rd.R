library(spatstat.utils)


### Name: revcumsum
### Title: Reverse Cumulative Sum
### Aliases: revcumsum
### Keywords: arith utilities

### ** Examples

  revcumsum(1:5)
  rev(cumsum(rev(1:5)))
  x <- runif(1e6)
  system.time(rev(cumsum(rev(x))))
  system.time(revcumsum(x))



