library(spatstat)


### Name: integral.linim
### Title: Integral on a Linear Network
### Aliases: integral.linim integral.linfun
### Keywords: spatial math

### ** Examples

  # make some data
  xcoord <- linfun(function(x,y,seg,tp) { x }, simplenet)
  integral(xcoord)
  X <- as.linim(xcoord)
  integral(X)

  # integrals inside each tile of a tessellation
  A <- quadrats(Frame(simplenet), 3)
  integral(X, A)



