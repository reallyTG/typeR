library(oce)


### Name: plot,rsk-method
### Title: Plot Rsk Data
### Aliases: plot,rsk-method plot.rsk

### ** Examples

library(oce)
data(rsk)
plot(rsk) # default timeseries plot of all data fields

## A multipanel plot of just pressure and temperature with ylim
par(mfrow=c(2, 1))
plot(rsk, which="pressure", ylim=c(10, 30))
plot(rsk, which="temperature", ylim=c(2, 4))




