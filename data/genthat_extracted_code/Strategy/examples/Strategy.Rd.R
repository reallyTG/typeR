library(Strategy)


### Name: Strategy
### Title: Create Strategy Object
### Aliases: Strategy

### ** Examples

##Not run:

# MA(200)-Strategy
params <- list(k=200)
myStrat.MA <- Strategy(assets=assets, strat="MA", strat.params=params)

# Own MA-strategy-function
# myStrat.MA <- Strategy(assets=assets, strat="C:/MA_function.R")

##End (Not run)



