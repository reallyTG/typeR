library(anchoredDistr)


### Name: reduceData
### Title: Apply the requested dimension reduction technique to the
###   inversion data for the given 'MADproject' object
### Aliases: reduceData reduceData,MADproject,function,ANY-method
###   reduceData,MADproject,function,function-method

### ** Examples

data(pumping)
pumping.min <- reduceData(pumping, min)
plotMAD(pumping.min, "realizations")




