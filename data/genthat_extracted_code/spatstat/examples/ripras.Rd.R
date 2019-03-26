library(spatstat)


### Name: ripras
### Title: Estimate window from points alone
### Aliases: ripras
### Keywords: spatial utilities

### ** Examples

  x <- runif(30)
  y <- runif(30)
  w <- ripras(x,y)
  plot(owin(), main="ripras(x,y)")
  plot(w, add=TRUE)
  points(x,y)

  X <- rpoispp(15)
  plot(X, main="ripras(X)")
  plot(ripras(X), add=TRUE)

  # two points insufficient
  ripras(c(0,1),c(0,0))
  # triangle
  ripras(c(0,1,0.5), c(0,0,1))
  # three collinear points
  ripras(c(0,0,0), c(0,1,2))



