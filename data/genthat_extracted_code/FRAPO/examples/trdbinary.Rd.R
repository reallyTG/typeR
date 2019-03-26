library(FRAPO)


### Name: trdbinary
### Title: Binary Trend
### Aliases: trdbinary trdbinary-methods trdbinary,data.frame-method
###   trdbinary,matrix-method trdbinary,mts-method trdbinary,numeric-method
###   trdbinary,timeSeries-method trdbinary,ts-method
### Keywords: ts smooth methods

### ** Examples

data(StockIndex)
y <- StockIndex[, "SP500"]
yret <- diff(log(y))
binary <- trdbinary(yret)
head(binary)



