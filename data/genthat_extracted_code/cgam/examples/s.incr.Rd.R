library(cgam)


### Name: s.incr
### Title: Specify a Smooth and Increasing Shape-Restriction in a CGAM
###   Formula
### Aliases: s.incr
### Keywords: shape routine

### ** Examples

  data(cubic)

  # extract x
  x <- cubic$x

  # extract y
  y <- cubic$y

  # regress y on x with the shape restriction: "smooth and increasing"
  ans <- cgam(y ~ s.incr(x))
  knots <- ans$knots[[1]]

  # make a plot
  par(mar = c(4, 4, 1, 1))
  plot(x, y, cex = .7, xlab = "x", ylab = "y")
  lines(x, ans$muhat, col = 2)
  legend("topleft", bty = "n", "smooth and increasing fit", col = 2, lty = 1)
  legend(1.7, 9.2, bty = "o", "knots", pch = "X")
  points(knots, 1:length(knots)*0+min(y), pch = "X")



