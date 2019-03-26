library(tseries)


### Name: sterling
### Title: Sterling Ratio
### Aliases: sterling
### Keywords: ts

### ** Examples

data(EuStockMarkets)
dax <- log(EuStockMarkets[,"DAX"])
ftse <- log(EuStockMarkets[,"FTSE"])
sterling(dax)
sterling(ftse)



