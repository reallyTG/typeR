library(BoomSpikeSlab)


### Name: qreg.spike
### Title: Quantile Regression
### Aliases: qreg.spike
### Keywords: models regression

### ** Examples

  n <- 50
  x <- rnorm(n)
  y <- rnorm(n, 4 * x)
  model <- qreg.spike(y ~ x,
                      quantile = .8,
                      niter = 1000,
                      expected.model.size = 100)

  ## Should get a slope near 4 and an intercept near qnorm(.8).
  PlotManyTs(model$beta[-(1:100),],
             same.scale = TRUE,
             truth = c(qnorm(.8), 4))




