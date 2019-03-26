library(timsac)


### Name: auspec
### Title: Power Spectrum
### Aliases: auspec
### Keywords: ts

### ** Examples

y <- arima.sim(list(order=c(2,0,0), ar=c(0.64,-0.8)), n = 200)
auspec(y, log = TRUE)



