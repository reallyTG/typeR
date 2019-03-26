library(Strategy)


### Name: hitratio
### Title: Strategy Hit Ratio
### Aliases: hitratio hitratio,Strategy-method

### ** Examples

## Not run:

# MA(200)-Strategy
params <- list(k=200)
myStrat.MA <- Strategy(assets=assets, strat="MA", strat.params=params)

# Get hit ratio of MA(200)-Strategy portfolio
hitratio(myStrat.MA, from="2015-01-01", until="2015-12-31")

# Get hit ratio of MA(200)-Strategy (daily data = 252 trading days)
# hitratio(myStrat.MA, from="2015-01-01", until="2015-12-31", use.backtest=TRUE)

## End(Not run)



