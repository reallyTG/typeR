library(cgam)


### Name: s.decr
### Title: Specify a Smooth and Decreasing Shape-Restriction in a CGAM
###   Formula
### Aliases: s.decr
### Keywords: shape routine

### ** Examples

  data(cubic)

  # extract x
  x <- - cubic$x

  # extract y
  y <- cubic$y

  # regress y on x under the shape-restriction: "smooth and decreasing"
  ans <- cgam(y ~ s.decr(x))
  knots <- ans$knots[[1]]

  # make a plot
  par(mar = c(4, 4, 1, 1))
  plot(x, y, cex = .7, xlab = "x", ylab = "y")
  lines(x, ans$muhat, col = 2)
  legend("topleft", bty = "n", "smooth and decreasing fit", col = 2, lty = 1)
  legend(-.3, 8, bty = "o", "knots", pch = "X")
  points(knots, 1:length(knots)*0+min(y), pch = "X")



