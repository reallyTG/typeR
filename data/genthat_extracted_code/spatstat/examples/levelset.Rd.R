library(spatstat)


### Name: levelset
### Title: Level Set of a Pixel Image
### Aliases: levelset
### Keywords: spatial programming manip

### ** Examples

  # test image
  X <- as.im(function(x,y) { x^2 - y^2 }, unit.square())

  W <- levelset(X, 0.2)
  W <- levelset(X, -0.3, ">")

  # compute area of level set
  area(levelset(X, 0.1))



