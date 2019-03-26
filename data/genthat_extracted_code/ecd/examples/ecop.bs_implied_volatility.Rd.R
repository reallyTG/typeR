library(ecd)


### Name: ecop.bs_implied_volatility
### Title: Implied volatility of Black-Sholes model
### Aliases: ecop.bs_implied_volatility
### Keywords: ecop

### ** Examples

V <- c(1.8, 50)
K <- c(2100, 2040)
S <- 2089.27
T <- 1/365
y <- 0.019
ecop.bs_implied_volatility(V, K, S, ttm=T, div_yield=y, otype="c")
# expect output of 12.8886% and 29.4296%



