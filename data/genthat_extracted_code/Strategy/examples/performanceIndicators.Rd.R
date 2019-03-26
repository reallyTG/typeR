library(Strategy)


### Name: performanceIndicators
### Title: Strategy Performance Indicators
### Aliases: performanceIndicators performanceIndicators,Strategy-method

### ** Examples

## Not run:

# MA(200)-Strategy
params <- list(k=200)
myStrat.MA <- Strategy(assets=assets, strat="MA", strat.params=params)

# Get performance indicators of MA(200)-Strategy assets
performanceIndicators(myStrat.MA, from="2015-01-01", until="2015-12-31")

## End(Not run)



