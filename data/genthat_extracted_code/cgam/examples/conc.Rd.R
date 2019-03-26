library(cgam)


### Name: conc
### Title: Specify a Concave Shape-Restriction in a CGAM Formula
### Aliases: conc
### Keywords: shape routine

### ** Examples

  # generate y
  x <- seq(-1, 2, by = 0.1)
  n <- length(x)
  y <- - x^2 + rnorm(n, .3)  

  # regress y on x under the shape-restriction: "concave"
  ans <- cgam(y ~ conc(x))

  # make a plot
  plot(x, y)
  lines(x, ans$muhat, col = 2)
  legend("topleft", bty = "n", "concave fit", col = 2, lty = 1)



