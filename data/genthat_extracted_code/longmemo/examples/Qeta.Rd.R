library(longmemo)


### Name: Qeta
### Title: Approximate Log Likelihood for Fractional Gaussian Noise /
###   Fractional ARIMA
### Aliases: Qeta
### Keywords: ts models

### ** Examples

data(NileMin)
y <- NileMin
n <- length(y)
yper <- per(scale(y))[2:(1+ (n-1) %/% 2)]
eta <- c(H = 0.3)
q.res <- Qeta(eta, n=n, yper=yper)
str(q.res)



