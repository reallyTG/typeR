library(spatstat)


### Name: connected
### Title: Connected components
### Aliases: connected connected.im connected.owin
### Keywords: spatial math

### ** Examples

  d <- distmap(cells, dimyx=256)
  X <- levelset(d, 0.07)
  plot(X)
  Z <- connected(X)
  plot(Z)
  # or equivalently
  Z <- connected(d <= 0.07)

  # number of components
  nc <- length(levels(Z))
  # plot with randomised colour map
  plot(Z, col=hsv(h=sample(seq(0,1,length=nc), nc)))

  # how to extract the components as a list of windows
  W <- tiles(tess(image=Z))



