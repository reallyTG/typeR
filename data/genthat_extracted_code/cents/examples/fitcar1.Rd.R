library(cents)


### Name: fitcar1
### Title: Fit AR(1) model with censoring and missing values
### Aliases: fitcar1
### Keywords: ts

### ** Examples

 z <- arima.sim(model=list(ar=0.8), n=100)
 z[50] <- NA
 fitcar1(z)



