library(bsts)


### Name: diagnostic-plots
### Title: Diagnostic Plots
### Aliases: qqdist AcfDist

### ** Examples


data(AirPassengers)
y <- log(AirPassengers)

ss <- AddLocalLinearTrend(list(), y)
ss <- AddSeasonal(ss, y, nseasons = 12)
model <- bsts(y, ss, niter = 500)

r <- residuals(model)
par(mfrow = c(1,2))
qqdist(r)   ## A bit of departure in the upper tail
AcfDist(r)  




