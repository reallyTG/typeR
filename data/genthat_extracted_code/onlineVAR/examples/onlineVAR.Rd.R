library(onlineVAR)


### Name: onlineVAR
### Title: Online Fitting of Time-Adaptive Lasso Vector Auto Regression.
### Aliases: onlineVAR onlineVAR.fit
### Keywords: vector time series regression

### ** Examples

data(aemo)

## use only subset of first 8000 time steps
y <- aemo[1:8000,]

## fit online lasso VAR
onlinefit <- onlineVAR(y, nu = 0.99, lags = 1, ahead = 1)

## plot coefficient matrix from last update
plot(onlinefit)

## compare mean root mean squared error to persistence 
c(onlinefit   = mean(sqrt(apply((predict(onlinefit)-y)^2, 2, 
    mean, na.rm = TRUE))),
  persistence = mean(sqrt(apply((aemo[1000:7999,]-y[1001:8000,])^2, 2, 
    mean))))



