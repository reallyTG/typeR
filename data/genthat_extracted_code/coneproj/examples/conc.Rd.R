library(coneproj)


### Name: conc
### Title: Specify a Concave Shape-Restriction in a SHAPEREG Formula
### Aliases: conc
### Keywords: shape routine

### ** Examples

  x <- seq(-1, 2, by = 0.1)
  n <- length(x)
  y <- - x^2 + rnorm(n, .3)  

  # regress y on x under the shape-restriction: "concave"
  ans <- shapereg(y ~ conc(x))

  # make a plot
  plot(x, y)
  lines(x, fitted(ans), col = 2)
  legend("bottomleft", bty = "n", "shapereg: concave fit", col = 2, lty = 1)



