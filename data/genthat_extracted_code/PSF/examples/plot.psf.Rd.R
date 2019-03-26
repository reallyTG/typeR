library(PSF)


### Name: plot.psf
### Title: Plot actual and forecasted values of an univariate time series
### Aliases: plot.psf

### ** Examples

## Train a PSF model from the univariate time series 'nottem' (package:datasets).
p <- psf(nottem)

## Forecast the next 12 values of such time series.
pred <- predict(p, n.ahead = 12)

## Plot forecasted values.
plot(p, pred)



