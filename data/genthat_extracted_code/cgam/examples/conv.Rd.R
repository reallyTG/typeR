library(cgam)


### Name: conv
### Title: Specify a Convex Shape-Restriction in a CGAM Formula
### Aliases: conv
### Keywords: shape routine

### ** Examples

  # generate y
  x <- seq(-1, 2, by = 0.1)
  n <- length(x)
  y <- x^2 + rnorm(n, .3)  

  # regress y on x under the shape-restriction: "convex"
  ans <- cgam(y ~ conv(x))

  # make a plot
  plot(x, y)
  lines(x, ans$muhat, col = 2)
  legend("topleft", bty = "n", "convex fit", col = 2, lty = 1)



