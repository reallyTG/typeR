library(Strategy)


### Name: getPrices
### Title: Get price data from 'Strategy'-object
### Aliases: getPrices getPrices,Strategy-method

### ** Examples

##Not run:

# MA(200)-Strategy
params <- list(k=200)
myStrat.MA <- Strategy(assets=assets, strat="MA", strat.params=params)

# Get price data from MA(200)-Strategy
getPrices(myStrat.MA, from="2015-01-01", until="2015-12-31")

##End(Not run)



