library(FRAPO)


### Name: trdwma
### Title: Weighted Moving Average
### Aliases: trdwma trdwma-methods trdwma,data.frame-method
###   trdwma,matrix-method trdwma,mts-method trdwma,numeric-method
###   trdwma,timeSeries-method trdwma,ts-method
### Keywords: ts smooth methods

### ** Examples

data(StockIndex)
y <- StockIndex[, "SP500"]
wma <- trdwma(y, weights = c(0.4, 0.3, 0.2, 0.1))
head(wma, 30)



