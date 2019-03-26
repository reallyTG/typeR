library(PSF)


### Name: predict.psf
### Title: Forecasting of univariate time series using a trained PSF model
### Aliases: predict.psf

### ** Examples

## Train a PSF model from the univariate time series 'nottem' (package:datasets).
p <- psf(nottem)

## Forecast the next 12 values of such time series.
pred <- predict(p, n.ahead = 12)



