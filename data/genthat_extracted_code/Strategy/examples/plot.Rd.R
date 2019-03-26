library(Strategy)


### Name: plot
### Title: Plot of a 'Strategy'-object
### Aliases: plot plot.Strategy plot,Strategy,missing-method

### ** Examples

##Not run:

# MA(200)-Strategy
params <- list(k=200)
myStrat.MA <- Strategy(assets=assets, strat="MA", strat.params=params)

# Plot first asset of MA(200)-Strategy
plot(myStrat.MA, from="2015-01-01", until="2015-12-31", which.assets=1)

##End(Not run)



