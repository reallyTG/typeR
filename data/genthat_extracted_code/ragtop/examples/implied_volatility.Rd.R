library(ragtop)


### Name: implied_volatility
### Title: Implied volatility of european-exercise option under
###   Black-Scholes or a jump-process extension
### Aliases: implied_volatility
### Keywords: Black-Scholes

### ** Examples

implied_volatility(2.5, 1, 100, 105, 0.01, 0.75)
implied_volatility(option_price = 17,
                   callput = CALL, S0 = 250,  K=245,
                   r = 0.005, time = 2,
                   const_default_intensity = 0.03)



