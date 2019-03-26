library(spatstat)


### Name: rlpp
### Title: Random Points on a Linear Network
### Aliases: rlpp
### Keywords: spatial datagen

### ** Examples

  g <- function(x, y, seg, tp) { exp(x + 3*y) }
  f <- linfun(g, simplenet)

  rlpp(20, f)

  plot(rlpp(20, f, nsim=3))



