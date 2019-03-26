library(ecd)


### Name: ecop.bs_option_price
### Title: Calculate option price from implied volatility in Black-Sholes
###   model
### Aliases: ecop.bs_option_price ecop.bs_call_price ecop.bs_put_price
### Keywords: ecop

### ** Examples

ivol <- c(0.128886, 0.294296) 
K <- c(2100, 2040)
S <- 2089.27
T <- 1/365
y <- 0.019
ecop.bs_option_price(ivol, K, S, ttm=T, div_yield=y, otype="c")
# expect output of c(1.8, 50)



