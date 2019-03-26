library(BoomSpikeSlab)


### Name: plot.qreg.spike
### Title: Plot the results of a spike and slab regression.
### Aliases: plot.qreg.spike
### Keywords: models regression

### ** Examples

  n <- 50
  x <- rnorm(n)
  y <- rnorm(n, 4 * x)
  model <- qreg.spike(y ~ x,
                      quantile = .8,
                      niter = 1000,
                      expected.model.size = 100)
  plot(model)
  plot(model, "coef")
  plot(model, "coefficients")
  plot(model, "scaled.coefficients")
  plot(model, "scal")
  plot(model, "size")
  plot(model, "help")



