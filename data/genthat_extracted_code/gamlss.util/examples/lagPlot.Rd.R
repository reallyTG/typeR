library(gamlss.util)


### Name: lagPlot
### Title: Lag plot for time series data
### Aliases: lagPlot
### Keywords: ts

### ** Examples

dax<-EuStockMarkets[,"DAX"]
ftse<-EuStockMarkets[,"FTSE"]
lagPlot(dax, lags=9)
lagPlot(dax, ftse, lags=8)



