library(Strategy)


### Name: getWeights
### Title: Get weights from 'Strategy'-object
### Aliases: getWeights getWeights,Strategy-method

### ** Examples

##Not run:

# MA(200)-Strategy
params <- list(k=200)
myStrat.MA <- Strategy(assets=assets, strat="MA", strat.params=params)

# Get weights data from MA(200)-Strategy
getWeights(myStrat.MA, from="2015-01-01", until="2015-12-31")

##End(Not run)



