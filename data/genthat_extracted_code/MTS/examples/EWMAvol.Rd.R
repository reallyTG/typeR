library(MTS)


### Name: EWMAvol
### Title: Exponentially Weighted Moving-Average Volatility
### Aliases: EWMAvol

### ** Examples

data("mts-examples",package="MTS")
rtn=log(ibmspko[,2:4]+1)
m1=EWMAvol(rtn)



