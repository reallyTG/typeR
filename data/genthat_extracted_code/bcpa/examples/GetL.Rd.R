library(bcpa)


### Name: GetL
### Title: Obtain likelihood of gappy Gaussian time series
### Aliases: GetL

### ** Examples

# create full time-series
rho <- 0.8
x.full <- arima.sim(1000, model=list(ar = rho))
t.full <- 1:1000

# subsample time series
keep <- sort(sample(1:1000, 200))
x <- x.full[keep]
t <- t.full[keep]
plot(t,x, type="l")

# sweep values of rho
rhos <- seq(0,.99,.01)
L <- rep(NA, length(rhos))
for(i in 1:length(rhos))
  L[i] <- GetL(x,t,rhos[i])

# plot likelihood profile
plot(rhos, L, type="l")
abline(v = rhos[L == max(L)], lty=3, lwd=2)
abline(v = rho, lty=2, lwd=2)
legend("bottomleft", legend=c("true value","MLE"), lty=3:2, lwd=2)



