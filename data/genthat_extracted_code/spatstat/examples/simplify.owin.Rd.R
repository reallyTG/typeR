library(spatstat)


### Name: simplify.owin
### Title: Approximate a Polygon by a Simpler Polygon
### Aliases: simplify.owin
### Keywords: spatial math

### ** Examples

  plot(letterR, col="red")
  plot(simplify.owin(letterR, 0.3), col="blue", add=TRUE)

  W <- Window(chorley)
  plot(W)
  WS <- simplify.owin(W, 2)
  plot(WS, add=TRUE, border="green")
  points(vertices(WS))



