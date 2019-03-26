library(FRAPO)


### Name: trdhp
### Title: Hodrick-Prescott Filter
### Aliases: trdhp trdhp-methods trdhp,data.frame-method
###   trdhp,matrix-method trdhp,mts-method trdhp,numeric-method
###   trdhp,timeSeries-method trdhp,ts-method
### Keywords: ts smooth methods

### ** Examples

data(StockIndex)
y <- StockIndex[, "SP500"]
hp <- trdhp(y, lambda = 1600)
head(hp)



