library(ghyp)


### Name: scale-methods
### Title: Scaling and Centering of ghyp Objects
### Aliases: scale.ghyp scale,ghyp-method
### Keywords: utilities methods

### ** Examples

  data(indices)

  t.fit <- fit.tmv(indices)
  gauss.fit <- fit.gaussmv(indices)

  ## Compare the fitted Student-t and Gaussian density.
  par(mfrow = c(1, 2))

  ## Once on the real scale...
  plot(t.fit[1], type = "l")
  lines(gauss.fit[1], col = "red")

  ## ...and once scaled to expectation = 0, variance = 1
  plot(scale(t.fit)[1], type = "l")
  lines(scale(gauss.fit)[1], col = "red")



