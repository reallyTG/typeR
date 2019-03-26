library(NMOF)


### Name: callCF
### Title: Price a Plain-Vanilla Call with the Characteristic Function
### Aliases: callCF cfBSM cfHeston cfBates cfMerton cfVG

### ** Examples

S <- 100; X <- 100; tau <- 1
r <- 0.02; q <- 0.08
v0 <- 0.2^2  ## variance, not volatility
vT <- 0.2^2  ## variance, not volatility
v <- vT
rho <- -0.3; k <- .2
sigma <- 0.3

## jump parameters (Merton and Bates)
lambda <- 0.1
muJ <- -0.2
vJ <- 0.1^2

## get Heston price and BSM implied volatility
callHestoncf(S, X, tau, r, q, v0, vT, rho, k, sigma, implVol = FALSE)
callCF(cf = cfHeston, S=S, X=X, tau=tau, r=r, q = q,
       v0 = v0, vT = vT, rho = rho, k = k, sigma = sigma, implVol = FALSE)

## Black-Scholes-Merton
callCF(cf = cfBSM, S=S, X=X, tau = tau, r = r, q = q,
       v = v, implVol = TRUE)

## Bates
callCF(cf = cfBates, S = S, X = X, tau = tau, r = r, q = q,
       v0 = v0, vT = vT, rho = rho, k = k, sigma = sigma,
       lambda = lambda, muJ = muJ, vJ = vJ, implVol = FALSE)

## Merton
callCF(cf = cfMerton, S = S, X = X, tau = tau, r = r, q = q,
       v = v, lambda = lambda, muJ = muJ, vJ = vJ, implVol = FALSE)

## variance gamma
nu <- 0.1; theta <- -0.1; sigma <- 0.15
callCF(cf = cfVG, S = S, X = X, tau = tau, r = r, q = q,
       nu = nu, theta = theta, sigma = sigma, implVol = FALSE)



