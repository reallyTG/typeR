library(FRAPO)


### Name: PMTD
### Title: Minimum Tail Dependent Portfolio
### Aliases: PMTD
### Keywords: optimize

### ** Examples

data(StockIndex)
Rets <- returnseries(StockIndex, method = "discrete", trim = TRUE,
                     percentage = TRUE)
PMTD(Rets)



