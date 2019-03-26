library(ShapeChange)


### Name: tp
### Title: Specify a Unimodal Category in a CHANGEPT Formula
### Aliases: tp
### Keywords: symbolic routine

### ** Examples

  # the underlying mean curve is unimodal with a mode at .8 
  n = 100
  x = seq(1/n, 1, length = n)

  # a categorical covariate z with two levels (0 and 1) 
  z = rep(0:1, 50)

  set.seed(123)
  y = 30 * x^4 * (1 - x) + (z == 1) * .5 + rnorm(n, sd = 1)
  ans = changept(y ~ tp(x) + factor(z), family = gaussian())

  plot(ans)
  legend("topleft", "constrained fit for z == 1", bty = "n", col = "skyblue", lty = 2, lwd = 2)



