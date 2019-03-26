library(BSSasymp)


### Name: eSOBI
### Title: The efficient SOBI estimator
### Aliases: eSOBI
### Keywords: multivariate ts

### ** Examples

A <- matrix(rnorm(9),3,3)
s1 <- arima.sim(list(ar=0.6),1000)
s2 <- arima.sim(list(ma=c(0.2,0.3,-0.3)),1000)
s3 <- arima.sim(list(ar=-0.2,ma=c(0.5,-0.1,0.4)),1000)

S <- cbind(s1,s2,s3)
X <- S %*% t(A)

taus <- list(1,1:2,1:5,1:12)
eSOBI(X, taus=taus)



