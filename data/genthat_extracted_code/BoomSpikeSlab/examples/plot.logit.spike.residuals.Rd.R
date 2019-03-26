library(BoomSpikeSlab)


### Name: plot.logit.spike.residuals
### Title: Residual plot for 'logit.spike' objects.
### Aliases: PlotLogitSpikeResiduals PlotProbitSpikeResiduals
### Keywords: models regression

### ** Examples

simulate.logit.spike <- function(n = 100, p = 10, ngood = 3,
                              niter=1000){
  x <- cbind(1, matrix(rnorm(n * (p-1)), nrow=n))
  beta <- c(rnorm(ngood), rep(0, p - ngood))
  prob <- plogis(x %*% beta)
  y <- runif(n) < prob
  x <- x[,-1]
  draws <- logit.spike(y ~ x, niter=niter)
  plot.ts(draws$beta)
  return(invisible(draws))
}
model <- simulate.logit.spike()
plot(model, "fit")
plot(model, "fit", scale = "probability", number.of.buckets = 15)



