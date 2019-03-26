library(Strategy)


### Name: plotWeights
### Title: Plot Strategy Weights
### Aliases: plotWeights plotWeights,Strategy-method

### ** Examples

##Not run:

# MA(200)-Strategy
params <- list(k=200)
myStrat.MA <- Strategy(assets=assets, strat="MA", strat.params=params)

# Plot MA(200)-Strategy weights
plotWeights(myStrat.MA)

##End(Not run)



