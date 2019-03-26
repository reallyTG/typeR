library(FRAPO)


### Name: returnseries
### Title: Continuous and discrete returns
### Aliases: returnseries returnseries-methods
###   returnseries,data.frame-method returnseries,matrix-method
###   returnseries,mts-method returnseries,numeric-method
###   returnseries,timeSeries-method returnseries,ts-method
### Keywords: ts methods

### ** Examples

data(StockIndex)
y <- StockIndex[, "SP500"]
ret <- returnseries(y)
head(ret)



