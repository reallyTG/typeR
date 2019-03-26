library(cgam)


### Name: decr
### Title: Specify a Decreasing Shape-Restriction in a CGAM Formula
### Aliases: decr
### Keywords: shape routine

### ** Examples

  data(cubic)

  # extract x
  x <- - cubic$x

  # extract y
  y <- cubic$y

  # regress y on x with the shape restriction: "decreasing"
  ans <- cgam(y ~ decr(x))

  # make a plot
  par(mar = c(4, 4, 1, 1))
  plot(x, y, cex = .7, xlab = "x", ylab = "y")
  lines(x, ans$muhat, col = 2)
  legend("bottomright", bty = "n", "decreasing fit", col = 2, lty = 1)




