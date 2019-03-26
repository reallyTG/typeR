library(spatstat)


### Name: bounding.box.xy
### Title: Convex Hull of Points
### Aliases: bounding.box.xy
### Keywords: spatial utilities

### ** Examples

  x <- runif(30)
  y <- runif(30)
  w <- bounding.box.xy(x,y)
  plot(owin(), main="bounding.box.xy(x,y)")
  plot(w, add=TRUE)
  points(x,y)

  X <- rpoispp(30)
  plot(X, main="bounding.box.xy(X)")
  plot(bounding.box.xy(X), add=TRUE)



