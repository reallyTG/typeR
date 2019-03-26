library(ragtop)


### Name: implied_volatility_with_term_struct
### Title: Find the implied volatility of a european-exercise option with
###   term structures
### Aliases: implied_volatility_with_term_struct

### ** Examples

## Dividends
divs = data.frame(time=seq(from=0.11, to=2, by=0.25),
                  fixed=seq(1.5, 1, length.out=8),
                  proportional = seq(1, 1.5, length.out=8))
surv_prob_fcn = function(T, t, ...) {
  exp(-0.07 * (T - t)) }
disc_factor_fcn = function(T, t, ...) {
  exp(-0.03 * (T - t)) }
implied_volatility_with_term_struct(
    option_price = 12, S0 = 150, callput=PUT,
    K = 147.50, time=1.5,
    discount_factor_fcn=disc_factor_fcn,
    survival_probability_fcn=surv_prob_fcn,
    dividends=divs)



