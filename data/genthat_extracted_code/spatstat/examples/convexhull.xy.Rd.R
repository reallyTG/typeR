library(spatstat)


### Name: convexhull.xy
### Title: Convex Hull of Points
### Aliases: convexhull.xy
### Keywords: spatial utilities

### ** Examples

  x <- runif(30)
  y <- runif(30)
  w <- convexhull.xy(x,y)
  plot(owin(), main="convexhull.xy(x,y)", lty=2)
  plot(w, add=TRUE)
  points(x,y)

  X <- rpoispp(30)
  plot(X, main="convexhull.xy(X)")
  plot(convexhull.xy(X), add=TRUE)



