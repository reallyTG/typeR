library(FRAPO)


### Name: trdbilson
### Title: Bilson Trend
### Aliases: trdbilson trdbilson-methods trdbilson,data.frame-method
###   trdbilson,matrix-method trdbilson,mts-method trdbilson,numeric-method
###   trdbilson,timeSeries-method trdbilson,ts-method
### Keywords: ts smooth methods

### ** Examples

data(StockIndex)
y <- StockIndex[, "SP500"]
yret <- diff(log(y))
bilson <- trdbilson(yret, exponent = 2)
head(bilson)



