library(FRAPO)


### Name: trdes
### Title: Exponentially Smoothed Trend
### Aliases: trdes trdes-methods trdes,data.frame-method
###   trdes,matrix-method trdes,mts-method trdes,numeric-method
###   trdes,timeSeries-method trdes,ts-method
### Keywords: ts smooth methods

### ** Examples

data(StockIndex)
y <- StockIndex[, "SP500"]
yret <- diff(log(y))
es <- trdes(yret, lambda = 0.95)
head(es)



