library(PerformanceAnalytics)


### Name: Return.portfolio
### Title: Calculate weighted returns for a portfolio of assets
### Aliases: Return.portfolio Return.rebalancing

### ** Examples


data(edhec)
Return.portfolio(edhec["1997",1:5], rebalance_on="quarters") # returns time series
Return.portfolio(edhec["1997",1:5], rebalance_on="quarters", verbose=TRUE) # returns list
# with a weights object
data(weights) # rebalance at the beginning of the year to various weights through time
chart.StackedBar(weights)
x <- Return.portfolio(edhec["2000::",1:11], weights=weights,verbose=TRUE)
chart.CumReturns(x$returns)
chart.StackedBar(x$BOP.Weight)
chart.StackedBar(x$BOP.Value)




