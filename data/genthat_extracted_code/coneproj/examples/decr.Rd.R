library(coneproj)


### Name: decr
### Title: Specify a Decreasing Shape-Restriction in a SHAPEREG Formula
### Aliases: decr
### Keywords: shape routine

### ** Examples

  data(cubic)

  # extract x
  x <- - cubic$x

  # extract y
  y <- cubic$y

  # regress y on x with the shape restriction: "decreasing"
  ans <- shapereg(y ~ decr(x))

  # make a plot
  par(mar = c(4, 4, 1, 1))
  plot(x, y, cex = .7, xlab = "x", ylab = "y")
  lines(x, fitted(ans), col = 2)
  legend("topleft", bty = "n", "shapereg: decreasing fit", col = 2, lty = 1)



