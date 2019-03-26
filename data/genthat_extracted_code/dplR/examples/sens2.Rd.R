library(dplR)


### Name: sens2
### Title: Calculate Mean Sensitivity on Series with a Trend
### Aliases: sens2
### Keywords: univar

### ** Examples
library(utils)
data(ca533)
ca533.rwi <- detrend(rwl = ca533, method = "ModNegExp")
sens2(ca533.rwi[, 1])



