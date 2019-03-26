library(coneproj)


### Name: decr.conv
### Title: Specify a Decreasing and Convex Shape-Restriction in a SHAPEREG
###   Formula
### Aliases: decr.conv
### Keywords: shape routine

### ** Examples

  data(cubic)

  # extract x
  x <- - cubic$x

  # extract y
  y <- cubic$y

  # regress y on x with the shape restriction: "decreasing" and "convex"
  ans <- shapereg(y ~ decr.conv(x))

  # make a plot
  par(mar = c(4, 4, 1, 1))
  plot(x, y, cex = .7, xlab = "x", ylab = "y")
  lines(x, fitted(ans), col = 2)
  legend("bottomright", bty = "n", "shapereg: decreasing and convex fit", col = 2, lty = 1)





