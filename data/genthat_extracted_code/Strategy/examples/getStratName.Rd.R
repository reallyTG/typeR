library(Strategy)


### Name: getStratName
### Title: Get strategy function name from 'Strategy'-object
### Aliases: getStratName getStratName,Strategy-method

### ** Examples

##Not run:

# MA(200)-Strategy
params <- list(k=200)
myStrat.MA <- Strategy(assets=assets, strat="MA", strat.params=params)

# Get strategy function name from MA(200)-Strategy
getStratName(myStrat.MA) # returns "MA"
getStratName(myStrat.MA, include.params=TRUE) # returns "MA(200)"

##End(Not run)



