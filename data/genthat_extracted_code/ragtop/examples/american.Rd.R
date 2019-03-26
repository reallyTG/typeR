library(ragtop)


### Name: american
### Title: Price one or more american-exercise options
### Aliases: american

### ** Examples

american(PUT, S0=100, K=110, time=0.77, const_short_rate = 0.06,
         const_volatility=0.20, num_time_steps=200)
american(callput=-1, S0=100, K=90, time=1, const_short_rate=0.025,
         variance_cumulation_fcn = function(T, t) {  # Term structure of vola
             0.45 ^ 2 * (T - t) + 0.15^2 * max(0, T-0.25)
         })



