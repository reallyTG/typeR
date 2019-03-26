library(PortfolioAnalytics)


### Name: optimize.portfolio.rebalancing
### Title: Portfolio Optimization with Rebalancing Periods
### Aliases: optimize.portfolio.rebalancing
###   optimize.portfolio.rebalancing_v1 optimize.portfolio.rebalancing
###   optimize.portfolio.rebalancing_v1

### ** Examples

## Not run: 
##D data(edhec)
##D R <- edhec[,1:4]
##D funds <- colnames(R)
##D 
##D portf <- portfolio.spec(funds)
##D portf <- add.constraint(portf, type="full_investment")
##D portf <- add.constraint(portf, type="long_only")
##D portf <- add.objective(portf, type="risk", name="StdDev")
##D 
##D # Quarterly rebalancing with 5 year training period
##D bt.opt1 <- optimize.portfolio.rebalancing(R, portf,
##D optimize_method="ROI",
##D rebalance_on="quarters",
##D training_period=60)
##D 
##D # Monthly rebalancing with 5 year training period and 4 year rolling window
##D bt.opt2 <- optimize.portfolio.rebalancing(R, portf,
##D optimize_method="ROI",
##D rebalance_on="months",
##D training_period=60,
##D rolling_window=48)
## End(Not run)



