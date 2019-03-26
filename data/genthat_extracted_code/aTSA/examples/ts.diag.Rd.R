library(aTSA)


### Name: ts.diag
### Title: Diagnostics for ARIMA fits
### Aliases: ts.diag

### ** Examples

x <- arima.sim(list(order = c(3,0,0),ar = c(0.2,0.4,-0.15)),n = 100)
fit <- estimate(x,p = 3) # same as fit <- arima(x,order = c(3,0,0))
ts.diag(fit)



