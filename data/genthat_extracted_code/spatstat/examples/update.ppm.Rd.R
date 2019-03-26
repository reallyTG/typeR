library(spatstat)


### Name: update.ppm
### Title: Update a Fitted Point Process Model
### Aliases: update.ppm
### Keywords: spatial methods models

### ** Examples

  data(nztrees)
  data(cells)

  # fit the stationary Poisson process
  fit <- ppm(nztrees, ~ 1)

  # fit a nonstationary Poisson process
  fitP <- update(fit, trend=~x)
  fitP <- update(fit, ~x)

  # change the trend formula: add another term to the trend
  fitPxy <- update(fitP, ~ . + y)
  # change the trend formula: remove the x variable
  fitPy <- update(fitPxy, ~ . - x)

  # fit a stationary Strauss process
  fitS <- update(fit, interaction=Strauss(13))
  fitS <- update(fit, Strauss(13))

  # refit using a different edge correction
  fitS <- update(fitS, correction="isotropic")

  # re-fit the model to a subset
  # of the original point pattern
  nzw <- owin(c(0,148),c(0,95))
  nzsub <- nztrees[,nzw]
  fut <- update(fitS, Q=nzsub)
  fut <- update(fitS, nzsub)

  # WARNING: the point pattern argument is called 'Q'

  ranfit <- ppm(rpoispp(42), ~1, Poisson())
  ranfit
  # different random data!  
  update(ranfit)
  # the original data
  update(ranfit, use.internal=TRUE)  




