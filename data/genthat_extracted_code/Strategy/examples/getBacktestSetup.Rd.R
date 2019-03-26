library(Strategy)


### Name: getBacktestSetup
### Title: Get backtest parameter values from 'Strategy'-object
### Aliases: getBacktestSetup getBacktestSetup,Strategy-method

### ** Examples

##Not run:

# MA(200)-Strategy
params <- list(k=200)
myStrat.MA <- Strategy(assets=assets, strat="MA", strat.params=params)

# Get backtest setup from MA(200)-Strategy
getBacktestSetup(myStrat.MA)

##End(Not run)



