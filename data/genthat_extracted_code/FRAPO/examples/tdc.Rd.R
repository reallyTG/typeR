library(FRAPO)


### Name: tdc
### Title: Tail Dependence Coefficient
### Aliases: tdc
### Keywords: algebra

### ** Examples

data(StockIndex)
Rets <- returnseries(StockIndex, method = "discrete", trim = TRUE,
                     percentage = TRUE)
tdc(Rets, method = "EmpTC")
tdc(Rets, method = "EVT")



