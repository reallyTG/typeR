library(cgam)


### Name: s.conv
### Title: Specify a Smooth and Convex Shape-Restriction in a CGAM Formula
### Aliases: s.conv
### Keywords: shape routine

### ** Examples

  # generate y
  x <- seq(-1, 2, by = 0.1)
  n <- length(x)
  y <- x^2 + rnorm(n, .3)  

  # regress y on x under the shape-restriction: "smooth and convex"
  ans <- cgam(y ~ s.conv(x))
  knots <- ans$knots[[1]]

  # make a plot
  plot(x, y)
  lines(x, ans$muhat, col = 2)
  legend("topleft", bty = "n", "smooth and convex fit", col = 2, lty = 1)
  legend(1.6, -1, bty = "o", "knots", pch = "X")
  points(knots, 1:length(knots)*0+min(y), pch = "X")  



