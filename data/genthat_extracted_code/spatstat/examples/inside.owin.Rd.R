library(spatstat)


### Name: inside.owin
### Title: Test Whether Points Are Inside A Window
### Aliases: inside.owin
### Keywords: spatial math

### ** Examples

  # hexagonal window
  k <- 6
  theta <- 2 * pi * (0:(k-1))/k
  co <- cos(theta)
  si <- sin(theta)
  mas <- owin(c(-1,1), c(-1,1), poly=list(x=co, y=si))
  ## Not run: 
##D   plot(mas)
##D   
## End(Not run)

  # random points in rectangle
  x <- runif(30,min=-1, max=1)
  y <- runif(30,min=-1, max=1)

  ok <- inside.owin(x, y, mas)

  ## Not run: 
##D   points(x[ok], y[ok])
##D   points(x[!ok], y[!ok], pch="x")
##D   
## End(Not run)  



