library(spatstat)


### Name: linfun
### Title: Function on a Linear Network
### Aliases: linfun
### Keywords: spatial math

### ** Examples

  f <- linfun(function(x,y,seg,tp) { x+y }, simplenet)
  plot(f)
  X <- runiflpp(3, simplenet)
  plot(X, add=TRUE, cex=2)
  f(X)



