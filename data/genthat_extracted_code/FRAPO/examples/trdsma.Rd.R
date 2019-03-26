library(FRAPO)


### Name: trdsma
### Title: Simple Moving Average
### Aliases: trdsma trdsma-methods trdsma,data.frame-method
###   trdsma,matrix-method trdsma,mts-method trdsma,numeric-method
###   trdsma,timeSeries-method trdsma,ts-method
### Keywords: ts smooth methods

### ** Examples

data(StockIndex)
y <- StockIndex[, "SP500"]
sma <- trdsma(y, n.periods = 24)
head(sma, 30)



