library(Strategy)


### Name: loss
### Title: Get the losses of assets or portfolio over time.
### Aliases: loss loss,Strategy-method

### ** Examples

## Not run:

# MA(200)-Strategy
params <- list(k=200)
myStrat.MA <- Strategy(assets=assets, strat="MA", strat.params=params)

# Get VaR of MA(200)-Strategy portfolio
myStrat.MA.losses <- loss(myStrat.MA, from="2015-01-01", until="2015-12-31")

## End(Not run)



