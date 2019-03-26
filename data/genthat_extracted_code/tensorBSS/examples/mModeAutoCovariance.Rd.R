library(tensorBSS)


### Name: mModeAutoCovariance
### Title: The m-Mode Autocovariance Matrix
### Aliases: mModeAutoCovariance
### Keywords: utilities array

### ** Examples

n <- 1000
S <- t(cbind(as.vector(arima.sim(n = n, list(ar = 0.9))),
             as.vector(arima.sim(n = n, list(ar = -0.9))),
             as.vector(arima.sim(n = n, list(ma = c(0.5, -0.5)))),
             as.vector(arima.sim(n = n, list(ar = c(-0.5, -0.3)))),
             as.vector(arima.sim(n = n, list(ar = c(0.5, -0.3, 0.1, -0.1), ma=c(0.7, -0.3)))),
             as.vector(arima.sim(n = n, list(ar = c(-0.7, 0.1), ma = c(0.9, 0.3, 0.1, -0.1))))))
dim(S) <- c(3, 2, n)

mModeAutoCovariance(S, m = 1, lag = 1)
mModeAutoCovariance(S, m = 1, lag = 4)



