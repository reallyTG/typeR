library(Strategy)


### Name: compare
### Title: Compare performance of 'Strategy'-objects.
### Aliases: compare compare,Strategy-method

### ** Examples

##Not run:

# MA(200)-Strategy
params <- list(k=200)
myStrat.MA <- Strategy(assets=assets, strat="MA", strat.params=params)

# EWMA(0.05)-Strategy
params <- list(lambda=0.05)
myStrat.EWMA <- Strategy(assets=assets, strat="EWMA", strat.params=params)

# Compare annualized performance of MA(200) and EWMA(0.05)
# compare(myStrat.MA, myStrat.EWMA, use.backtest=TRUE, scaling.periods=252)

##End(Not run)



