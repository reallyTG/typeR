library(oce)


### Name: binMean1D
### Title: Bin-average f=f(x)
### Aliases: binMean1D

### ** Examples

library(oce)
data(ctd)
z <- ctd[["z"]]
T <- ctd[["temperature"]]
plot(T, z)
TT <- binMean1D(z, T, seq(-100, 0, 1))
lines(TT$result, TT$xmids, col='red')




