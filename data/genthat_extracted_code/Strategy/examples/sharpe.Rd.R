library(Strategy)


### Name: sharpe
### Title: Get Sharpe Ratio of Performance
### Aliases: sharpe sharpe,Strategy-method

### ** Examples

## Not run:

# MA(200)-Strategy
params <- list(k=200)
myStrat.MA <- Strategy(assets=assets, strat="MA", strat.params=params)

# Get sharpe of MA(200)-Strategy portfolio
sharpe(myStrat.MA, from="2015-01-01", until="2015-12-31")

# Get backtest annualized sharpe of MA(200)-Strategy (daily data = 252 trading days)
# sharpe(myStrat.MA, from="2015-01-01", until="2015-12-31", use.backtest=TRUE, scaling.periods=252)

## End(Not run)



