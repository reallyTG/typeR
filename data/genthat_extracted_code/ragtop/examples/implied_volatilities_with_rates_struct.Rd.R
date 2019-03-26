library(ragtop)


### Name: implied_volatilities_with_rates_struct
### Title: Find the implied volatility of european-exercise options with a
###   term structure of interest rates
### Aliases: implied_volatilities_with_rates_struct

### ** Examples

  d_fcn = function(T,t) {exp(-0.03*(T-t))}
  implied_volatilities_with_rates_struct(c(23,24,25),
         c(-1,1,1), 100, 100,
         discount_factor_fcn=d_fcn, time=c(4,4,5))




