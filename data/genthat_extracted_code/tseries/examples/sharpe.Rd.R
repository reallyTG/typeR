library(tseries)


### Name: sharpe
### Title: Sharpe Ratio
### Aliases: sharpe
### Keywords: ts

### ** Examples

data(EuStockMarkets)
dax <- log(EuStockMarkets[,"DAX"])
ftse <- log(EuStockMarkets[,"FTSE"])
sharpe(dax)
sharpe(ftse)



