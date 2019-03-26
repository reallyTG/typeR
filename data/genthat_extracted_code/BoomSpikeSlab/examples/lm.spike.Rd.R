library(BoomSpikeSlab)


### Name: lm.spike
### Title: Spike and slab regression
### Aliases: lm.spike spikeslab
### Keywords: models regression

### ** Examples

  n <- 100
  p <- 10
  ngood <- 3
  niter <- 1000
  sigma <- .8

  x <- cbind(1, matrix(rnorm(n * (p-1)), nrow=n))
  beta <- c(rnorm(ngood), rep(0, p - ngood))
  y <- rnorm(n, x %*% beta, sigma)
  x <- x[,-1]
  model <- lm.spike(y ~ x, niter=niter)
  plot.ts(model$beta)
  hist(model$sigma)  ## should be near 8
  plot(model)
  summary(model)
  plot(model, "residuals")

  ## Now replace the first observation with a big outlier.
  y[1] <- 50
  model <- lm.spike(y ~ x, niter = niter)
  model2 <- lm.spike(y ~ x, niter = niter, error.distribution = "student")
  pred <- predict(model, newdata = x)
  pred2 <- predict(model2, newdata = x)

  ## Maximize the plot window before making these box plots.  They show
  ## the posterior predictive distribution of all 100 data points, so
  ## make sure your screen is 100 boxes wide!
  par(mfrow = c(2,1))
  BoxplotTrue(t(pred), truth = y, ylim = range(pred), pch = ".",
     main = "Posterior predictive distribution assuming Gaussian errors.")
  BoxplotTrue(t(pred2), truth = y, ylim  = range(pred), pch = ",",
     main = "Posterior predictive distribution assuming Student errors.")

  ## The posterior predictive distributions are much tighter in the
  ## student case than in the Gaussian case, even though the student
  ## model has heavier tails, because the "sigma" parameter is smaller.
  par(mfrow = c(1,1))
  CompareDensities(list(gaussian = model$sigma, student = model2$sigma),
                        xlab = "sigma")



