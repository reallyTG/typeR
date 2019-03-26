library(onlineVAR)


### Name: plot.onlineVAR
### Title: Coefficient matrix plots for onlineVAR objects.
### Aliases: plot.onlineVAR
### Keywords: vector time series regression

### ** Examples

data(aemo)

## use only subset of first 8000 time steps
y <- aemo[1:8000,]

## fit online lasso VAR
onlinefit <- onlineVAR(y, nu = 0.99, lags = 1, ahead = 1)

## plot coefficient matrix from last update
plot(onlinefit)




