library(funtimes)


### Name: HVK
### Title: HVK Estimator
### Aliases: HVK
### Keywords: ts

### ** Examples

X <- arima.sim(n = 300, list(order = c(1, 0, 0), ar = c(0.6)))
HVK(as.vector(X), ar.order = 1)




