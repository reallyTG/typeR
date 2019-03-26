library(cgam)


### Name: umbrella
### Title: Specify an Umbrella-Ordering in a CGAM Formula
### Aliases: umbrella
### Keywords: shape routine

### ** Examples

  # generate y
  set.seed(123)
  n <- 20
  x <- seq(-2, 2, length = n)
  y <- - x^2 + rnorm(n)

  # regress y on x under the umbrella-ordering restriction
  fit <- cgam(y ~ umbrella(x)) 

  # make a plot
  par(mar = c(4, 4, 1, 1))
  plot(x, y, cex = .7, ylab = "y")
  lines(x, fit$muhat, col = 2)
  legend("topleft", bty = "n", "umbrella-ordering fit", col = 2, lty = 1)



