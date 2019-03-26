library(dplR)


### Name: sens1
### Title: Calculate Mean Sensitivity
### Aliases: sens1
### Keywords: univar

### ** Examples
library(utils)
data(ca533)
ca533.rwi <- detrend(rwl = ca533, method = "ModNegExp")
sens1(ca533.rwi[, 1])



