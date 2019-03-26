library(itsmr)


### Name: itsmr-package
### Title: Time Series Analysis Using the Innovations Algorithm
### Aliases: itsmr-package itsmr
### Keywords: package

### ** Examples

plotc(wine)

## Define a suitable data model
M = c("log","season",12,"trend",1)

## Obtain residuals and check for stationarity
e = Resid(wine,M)
test(e)

## Define a suitable ARMA model
a = arma(e,p=1,q=1)

## Obtain residuals and check for white noise
ee = Resid(wine,M,a)
test(ee)

## Forecast future values
forecast(wine,M,a)



