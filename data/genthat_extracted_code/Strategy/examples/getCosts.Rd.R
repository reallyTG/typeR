library(Strategy)


### Name: getCosts
### Title: Get strategy function from 'Strategy'-object
### Aliases: getCosts getCosts,Strategy-method

### ** Examples

##Not run:

# MA(200)-Strategy
params <- list(k=200)
myStrat.MA <- Strategy(assets=assets, strat="MA", strat.params=params)

# Get strategy function from MA(200)-Strategy
MA.costs <- getCosts(myStrat.MA)
# return fix costs
MA.costs$fix
# return relative costs
MA.costs$relative

##End(Not run)



