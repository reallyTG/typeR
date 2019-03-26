library(Strategy)


### Name: plotDrawdowns
### Title: Plot Strategy Drawdowns
### Aliases: plotDrawdowns plotDrawdowns,Strategy-method

### ** Examples

##Not run:

# MA(200)-Strategy
params <- list(k=200)
myStrat.MA <- Strategy(assets=assets, strat="MA", strat.params=params)

# Plot MA(200)-Strategy drawdowns
plotDrawdowns(myStrat.MA, from="2015-01-01", until="2015-12-31")

# Plot backtested MA(200)-Strategy drawdowns
# plotDrawdowns(myStrat.MA, from="2015-01-01", until="2015-12-31", use.backtest=TRUE)

##End(Not run)



