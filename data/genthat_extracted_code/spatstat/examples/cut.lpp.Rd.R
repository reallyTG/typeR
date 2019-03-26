library(spatstat)


### Name: cut.lpp
### Title: Classify Points in a Point Pattern on a Network
### Aliases: cut.lpp
### Keywords: spatial methods

### ** Examples

  X <- runiflpp(20, simplenet)
  f <- linfun(function(x,y,seg,tp) { x }, simplenet)
  plot(cut(X, f, breaks=4))
  plot(cut(X, "x", breaks=4))
  plot(cut(X, "seg"))



