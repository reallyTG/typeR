library(spatstat)


### Name: inside.boxx
### Title: Test Whether Points Are Inside A Multidimensional Box
### Aliases: inside.boxx
### Keywords: spatial math

### ** Examples

  # Random points in box with side [0,2]
  w <- boxx(c(0,2), c(0,2), c(0,2))

  # Random points in box with side [-1,3]
  x <- runif(30, min=-1, max=3)
  y <- runif(30, min=-1, max=3)
  z <- runif(30, min=-1, max=3)

  # Points falling in smaller box
  ok <- inside.boxx(x, y, z, w=w)

  # Same using a point pattern as argument:
  X <- ppx(data = cbind(x, y, z), domain = boxx(c(0,3), c(0,3), c(0,3)))
  ok2 <- inside.boxx(X, w=w)



