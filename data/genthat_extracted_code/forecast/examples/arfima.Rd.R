library(forecast)


### Name: arfima
### Title: Fit a fractionally differenced ARFIMA model
### Aliases: arfima
### Keywords: ts

### ** Examples


library(fracdiff)
x <- fracdiff.sim( 100, ma=-.4, d=.3)$series
fit <- arfima(x)
tsdisplay(residuals(fit))




