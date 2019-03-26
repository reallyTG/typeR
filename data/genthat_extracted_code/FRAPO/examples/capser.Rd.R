library(FRAPO)


### Name: capser
### Title: Capping a series to bounds
### Aliases: capser capser-methods capser,data.frame-method
###   capser,matrix-method capser,mts-method capser,numeric-method
###   capser,timeSeries-method capser,ts-method
### Keywords: ts smooth methods

### ** Examples

data(StockIndex)
y <- StockIndex[, "SP500"]
cs <- capser(y, min = 100, max = 200)
head(cs)



