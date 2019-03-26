library(Strategy)


### Name: getSignals
### Title: Get trading signals from 'Strategy'-object
### Aliases: getSignals getSignals,Strategy-method

### ** Examples

##Not run:

# MA(200)-Strategy
params <- list(k=200)
myStrat.MA <- Strategy(assets=assets, strat="MA", strat.params=params)

# Get signals from MA(200)-Strategy
# all signals returned
getSignals(myStrat.MA)
# backtest signals for first two assets returned
# getSignals(myStrat.MA, which=c(1,2), use.backtest=TRUE)

##End(Not run)



