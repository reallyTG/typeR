library(cgam)


### Name: decr.conv
### Title: Specify a Decreasing and Convex Shape-Restriction in a CGAM
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
  ans <- cgam(y ~ decr.conv(x))

  # make a plot
  par(mar = c(4, 4, 1, 1))
  plot(x, y, cex = .7, xlab = "x", ylab = "y")
  lines(x, ans$muhat, col = 2)
  legend("bottomright", bty = "n", "decreasing and convex fit", col = 2, lty = 1)




