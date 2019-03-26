library(cgam)


### Name: decr.conc
### Title: Specify a Decreasing and Concave Shape-Restriction in a CGAM
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
  ans <- cgam(y ~ decr.conc(x))

  # make a plot
  par(mar = c(4, 4, 1, 1))
  plot(x, y, cex = .7, xlab = "x", ylab = "y")
  lines(x, ans$muhat, col = 2)
  legend("topleft", bty = "n", "decreasing and concave fit", col = 2, lty = 1)




