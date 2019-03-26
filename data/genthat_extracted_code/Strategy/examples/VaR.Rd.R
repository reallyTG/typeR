library(Strategy)


### Name: VaR
### Title: Value at Risk
### Aliases: VaR VaR,Strategy-method

### ** Examples

## Not run:

# MA(200)-Strategy
params <- list(k=200)
myStrat.MA <- Strategy(assets=assets, strat="MA", strat.params=params)

# Get VaR of MA(200)-Strategy portfolio
VaR(myStrat.MA, from="2015-01-01", until="2015-12-31")

# Get backtest VaR of MA(200)-Strategy
# VaR(myStrat.MA, from="2015-01-01", until="2015-12-31", use.backtest=TRUE)

## End(Not run)



