library(coneproj)


### Name: decr.conc
### Title: Specify a Decreasing and Concave Shape-Restriction in a SHAPEREG
###   Formula
### Aliases: decr.conc
### Keywords: shape routine

### ** Examples

  data(cubic)

  # extract x
  x <-  cubic$x

  # extract y
  y <- - cubic$y

  # regress y on x with the shape restriction: "decreasing" and "concave"
  ans <- shapereg(y ~ decr.conc(x))

  # make a plot
  par(mar = c(4, 4, 1, 1))
  plot(x, y, cex = .7, xlab = "x", ylab = "y")
  lines(x, fitted(ans), col = 2)
  legend("bottomleft", bty = "n", "shapereg: decreasing and concave fit", col = 2, lty = 1)




