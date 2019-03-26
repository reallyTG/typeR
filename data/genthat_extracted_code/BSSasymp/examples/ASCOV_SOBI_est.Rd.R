library(BSSasymp)


### Name: ASCOV_SOBI_est
### Title: Asymptotic covariance matrix of symmetric and deflation-based
###   SOBI estimates
### Aliases: ASCOV_SOBI_est ASCOV_SOBIdefl_est ASCOV_SOBI_estN
###   ASCOV_SOBIdefl_estN
### Keywords: multivariate ts

### ** Examples

A<- matrix(rnorm(9),3,3)
s1 <- arima.sim(list(ar=0.6),1000)
s2 <- arima.sim(list(ma=c(0.2,0.3,-0.3)),1000)
s3 <- arima.sim(list(ar=-0.2,ma=c(0.5,-0.1,0.4)),1000)

S <- cbind(s1,s2,s3)
X <- S %*% t(A)

round(1000*ASCOV_SOBI_estN(X, taus=1:10)$COV_W,2)
round(1000*ASCOV_SOBIdefl_estN(X, taus=1:10)$COV_W,2)




