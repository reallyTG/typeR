library(Strategy)


### Name: getParameters
### Title: Get strategy function parameters from 'Strategy'-object
### Aliases: getParameters getParameters,Strategy-method

### ** Examples

##Not run:

# MA(200)-Strategy
params <- list(k=200)
myStrat.MA <- Strategy(assets=assets, strat="MA", strat.params=params)

# Get parameters from MA(200)-Strategy
getParameters(myStrat.MA)

##End(Not run)



