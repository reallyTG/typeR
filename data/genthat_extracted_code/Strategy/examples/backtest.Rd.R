library(Strategy)


### Name: backtest
### Title: Backtest Strategy
### Aliases: backtest backtest,Strategy-method

### ** Examples

##Not run:
# MA(200)-Strategy
params <- list(k=20)
# reduce dataset due to computation time
assets_r <- assets[tail(zoo::index(assets),100)]
myStrat.MA <- Strategy(assets=assets_r, strat="MA", strat.params=params)

# Perform backtest on MA(20)-Strategy with
# out-of-sample periods of 2 months
# and in-sample-calibration of 2 months
# This example requires a lot of computation time,
# so this is only performed for 1 asset and high scaling.
backtest(myStrat.MA, horizon="2m", data.width="2m"
         , optim.param="k", optim.param.min=5, optim.param.max=10
         , optim.param.scale=5, printSteps = TRUE, which=1)
##End(Not run)



