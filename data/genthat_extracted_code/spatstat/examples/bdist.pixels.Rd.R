library(spatstat)


### Name: bdist.pixels
### Title: Distance to Boundary of Window
### Aliases: bdist.pixels
### Keywords: spatial math

### ** Examples

  u <- owin(c(0,1),c(0,1))
  d <- bdist.pixels(u, eps=0.01)
  image(d)
  d <- bdist.pixels(u, eps=0.01, style="matrix")
  mean(d >= 0.1)
  # value is approx (1 - 2 * 0.1)^2 = 0.64



