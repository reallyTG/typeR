library(ragtop)


### Name: black_scholes_on_term_structures
### Title: Black-Scholes pricing of european-exercise options with term
###   structure arguments
### Aliases: black_scholes_on_term_structures

### ** Examples

black_scholes_on_term_structures(callput=-1, S0=100, K=90, time=1,
                                 discount_factor_fcn = function(T, t, ...) {
                                   exp(-0.03 * (T - t))
                                 },
                                 survival_probability_fcn = function(T, t, ...) {
                                   exp(-0.07 * (T - t))
                                 },
                                 variance_cumulation_fcn = function(T, t) {
                                   0.45 ^ 2 * (T - t)
                                 })



