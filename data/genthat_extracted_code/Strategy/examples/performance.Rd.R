library(Strategy)


### Name: performance
### Title: Get Strategy Performance
### Aliases: performance performance,Strategy-method

### ** Examples

## Not run:

# MA(200)-Strategy
params <- list(k=200)
myStrat.MA <- Strategy(assets=assets, strat="MA", strat.params=params)

# Get performance of MA(200)-Strategy
performance(myStrat.MA, from="2015-01-01", until="2015-12-31")

# Get backtest performance of MA(200)-Strategy
# performance(myStrat.MA, from="2015-01-01", until="2015-12-31"
# , use.backtest=TRUE, type="logReturns")

## End(Not run)



