library(ragtop)


### Name: implied_jump_process_volatility
### Title: Implied volatility of any instrument
### Aliases: implied_jump_process_volatility
### Keywords: calibration

### ** Examples

implied_jump_process_volatility(
    25, AmericanOption(maturity=1.1, strike=100, callput=-1),
    S0=100, num_time_steps=50, relative_tolerance=1.e-3)




