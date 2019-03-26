library(FRAPO)


### Name: returnconvert
### Title: Convert Returns from continuous to discrete and vice versa
### Aliases: returnconvert returnconvert-methods
###   returnconvert,data.frame-method returnconvert,matrix-method
###   returnconvert,mts-method returnconvert,numeric-method
###   returnconvert,timeSeries-method returnconvert,ts-method
### Keywords: ts methods

### ** Examples

data(StockIndex)
yc <- diff(log(StockIndex[, "SP500"])) * 100
yd <- returnseries(StockIndex[, "SP500"], method = "discrete",
                   percentage = TRUE, trim = TRUE)
yconv <- returnconvert(yd, convdir = "disc2cont",
                       percentage = TRUE)
all.equal(yc, yconv)



