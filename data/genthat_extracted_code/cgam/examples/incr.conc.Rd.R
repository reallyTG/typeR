library(cgam)


### Name: incr.conc
### Title: Specify an Increasing and Concave Shape-Restriction in a CGAM
###   Formula
### Aliases: incr.conc
### Keywords: shape routine

### ** Examples

  data(cubic)

  # extract x
  x <- - cubic$x

  # extract y
  y <- - cubic$y

  # regress y on x with the shape restriction: "increasing" and "concave"
  ans <- cgam(y ~ incr.conc(x))

  # make a plot
  par(mar = c(4, 4, 1, 1))
  plot(x, y, cex = .7, xlab = "x", ylab = "y")
  lines(x, ans$muhat, col = 2)
  legend("topleft", bty = "n", "increasing and concave fit", col = 2, lty = 1)




