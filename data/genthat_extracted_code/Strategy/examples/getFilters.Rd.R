library(Strategy)


### Name: getFilters
### Title: Get strategy values from 'Strategy'-object
### Aliases: getFilters getFilters,Strategy-method

### ** Examples

##Not run:

# MA(200)-Strategy
params <- list(k=200)
myStrat.MA <- Strategy(assets=assets, strat="MA", strat.params=params)

# Get strategy values from MA(200)-Strategy
getFilters(myStrat.MA) # all strategy values returned

##End(Not run)



