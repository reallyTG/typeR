library(Strategy)


### Name: getTrades
### Title: Get trades according to the signals from the 'Strategy'-object
### Aliases: getTrades getTrades,Strategy-method

### ** Examples

##Not run:

# MA(200)-Strategy
params <- list(k=200)
myStrat.MA <- Strategy(assets=assets, strat="MA", strat.params=params)

# Get price data from MA(200)-Strategy
getTrades(myStrat.MA, from="2015-01-01", until="2015-12-31")

##End(Not run)



