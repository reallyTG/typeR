library(EGRET)


### Name: generalAxis
### Title: Axis generation for log discharge
### Aliases: generalAxis
### Keywords: graphics statistics water-quality

### ** Examples

eList <- Choptank_eList
Daily <- getDaily(eList)
INFO <- getInfo(eList)
x <- Daily$Q
max <- max(x)
min <- 0
units <- INFO$param.units
generalAxis(x, max, min, units)
min <- min(x)
generalAxis(x, max, min, units, log=TRUE)



