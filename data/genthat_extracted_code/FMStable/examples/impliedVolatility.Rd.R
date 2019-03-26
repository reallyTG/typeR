library(FMStable)


### Name: impliedVolatility
### Title: Computations Regarding Value of Options for Log Normal
###   Distributions
### Aliases: BSOptionValue ImpliedVol lnorm.param
### Keywords: distribution

### ** Examples

lnorm.param(mean=5, sd=.8) 
BSOptionValue(spot=4, strike=c(4, 4.5), expiry=.5, volatility=.15)
ImpliedVol(spot=4, strike=c(4, 4.5), expiry=.5, price=c(.18,.025))



