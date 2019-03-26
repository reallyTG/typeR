library(NMOF)


### Name: callHestoncf
### Title: Price of a European Call under the Heston Model
### Aliases: callHestoncf

### ** Examples

S <- 100; X <- 100; tau <- 1; r <- 0.02; q <- 0.01
v0  <- 0.2^2  ## variance, not volatility
vT  <- 0.2^2  ## variance, not volatility
rho <- -0.7; k <- 0.2; sigma <- 0.5

## get Heston price and BSM implied volatility
result <- callHestoncf(S = S, X = X, tau = tau, r = r, q = q,
                       v0 = v0, vT = vT, rho = rho, k = k,
                       sigma = sigma, implVol = TRUE)

## Heston price
result[[1L]]

## price BSM with implied volatility
vol <- result[[2L]]
d1 <- (log(S/X) + (r - q + vol^2 / 2)*tau) / (vol*sqrt(tau))
d2 <- d1 - vol*sqrt(tau)
callBSM <- S * exp(-q * tau) * pnorm(d1) -
           X * exp(-r * tau) * pnorm(d2)
callBSM  ## should be (about) the same as result[[1L]]



