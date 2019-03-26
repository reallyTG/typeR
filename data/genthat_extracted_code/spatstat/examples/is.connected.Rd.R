library(spatstat)


### Name: is.connected
### Title: Determine Whether an Object is Connected
### Aliases: is.connected is.connected.default is.connected.linnet
### Keywords: spatial math

### ** Examples

  d <- distmap(cells, dimyx=256)
  X <- levelset(d, 0.07)
  plot(X)
  is.connected(X)



