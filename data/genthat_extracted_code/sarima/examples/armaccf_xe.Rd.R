library(sarima)


### Name: armaccf_xe
### Title: Crosscovariances between an ARMA process and its innovations
### Aliases: armaccf_xe armaacf
### Keywords: ts arma

### ** Examples

## Example 1 from ?ltsa::tacvfARMA
z <- sqrt(sunspot.year)
n <- length(z)
p <- 9
q <- 0
ML <- 5
out <- arima(z, order = c(p, 0, q))

phi <- theta <- numeric(0)
if (p > 0) phi <- coef(out)[1:p]
if (q > 0) theta <- coef(out)[(p+1):(p+q)]
zm <- coef(out)[p+q+1]
sigma2 <- out$sigma2

armaacf(list(ar = phi, ma = theta, sigma2 = sigma2), lag.max = 20)
## this illustrates that the methods
## based on ARMAacf and tacvARMA are equivalent:
armaacf(list(ar = phi, ma = theta, sigma2 = sigma2), lag.max = 20, compare = TRUE)

## In the original example in ?ltsa::tacvfARMA
## the comparison is with var(z), not with the theoretical variance:
rA <- ltsa::tacvfARMA(phi, - theta, maxLag=n+ML-1, sigma2=sigma2)
rB <- var(z) * ARMAacf(ar=phi, ma=theta, lag.max=n+ML-1)
## so rA and rB are different.
## but the difference is due to the variance:
rB2 <- rA[1] * ARMAacf(ar=phi, ma=theta, lag.max=n+ML-1)
cbind(rA[1:5], rB[1:5], rB2[1:5])

## There is no need to use specific functions,
## autocovariances() is most convenient for routine use:
armalist <- list(ar = phi, ma = theta, sigma2 = sigma2)
autocovariances(armalist, maxlag = 10)

## even better, set up an ARMA model:
mo <- new("ArmaModel", ar = phi, ma = theta, sigma2 = sigma2)
autocovariances(mo, maxlag = 10)



