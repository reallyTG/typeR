library(Strategy)


### Name: ES
### Title: Expected Shortfall
### Aliases: ES ES,Strategy-method

### ** Examples

##Not run:

# MA(200)-Strategy
params <- list(k=200)
myStrat.MA <- Strategy(assets=assets, strat="MA", strat.params=params)

# Get ES of MA(200)-Strategy portfolio
ES(myStrat.MA, from="2015-01-01", until="2015-12-31")

# Get backtest ES of MA(200)-Strategy (backtest would need to be executed first!)
# ES(myStrat.MA, from="2015-01-01", until="2015-12-31", use.backtest=TRUE)

##End(Not run)



