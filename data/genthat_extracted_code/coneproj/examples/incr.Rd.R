library(coneproj)


### Name: incr
### Title: Specify an Increasing Shape-Restriction in a SHAPEREG Formula
### Aliases: incr
### Keywords: shape routine

### ** Examples

  data(cubic)

  # extract x
  x <- cubic$x

  # extract y
  y <- cubic$y

  # regress y on x with the shape restriction: "increasing"
  ans <- shapereg(y ~ incr(x))

  # make a plot
  par(mar = c(4, 4, 1, 1))
  plot(x, y, cex = .7, xlab = "x", ylab = "y")
  lines(x, fitted(ans), col = 2)
  legend("topleft", bty = "n", "shapereg: increasing fit", col = 2, lty = 1)



