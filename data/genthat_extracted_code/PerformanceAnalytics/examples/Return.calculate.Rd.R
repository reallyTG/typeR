library(PerformanceAnalytics)


### Name: Return.calculate
### Title: calculate simple or compound returns from prices
### Aliases: Return.calculate CalculateReturns CalculateReturns

### ** Examples


  ## Not run: 
##D     require(quantmod)
##D     prices = getSymbols("IBM", from = "1999-01-01", to = "2007-01-01")
##D   
## End(Not run)
  ## Don't show: 
    data(prices)
  
## End(Don't show)
R.IBM = Return.calculate(xts(prices), method="discrete")
colnames(R.IBM)="IBM"
chart.CumReturns(R.IBM,legend.loc="topleft", main="Cumulative Daily Returns for IBM")
round(R.IBM,2)



