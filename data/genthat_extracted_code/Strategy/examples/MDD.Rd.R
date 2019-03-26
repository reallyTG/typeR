library(Strategy)


### Name: MDD
### Title: Strategy Performance Maximum Drawdown
### Aliases: MDD MDD,Strategy-method

### ** Examples

## Not run:

# MA(200)-Strategy
params <- list(k=200)
myStrat.MA <- Strategy(assets=assets, strat="MA", strat.params=params)

# Get MDD of MA(200)-Strategy portfolio
MDD(myStrat.MA, from="2015-01-01", until="2015-12-31")

# Get MDD of MA(200)-Strategy (daily data = 252 trading days)
# MDD(myStrat.MA, from="2015-01-01", until="2015-12-31", use.backtest=TRUE)

## End(Not run)



