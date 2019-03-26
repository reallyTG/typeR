library(forecast)


### Name: simulate.ets
### Title: Simulation from a time series model
### Aliases: simulate.ets simulate.Arima simulate.ar simulate.fracdiff
###   simulate.nnetar simulate.modelAR
### Keywords: ts

### ** Examples

fit <- ets(USAccDeaths)
plot(USAccDeaths, xlim=c(1973,1982))
lines(simulate(fit, 36), col="red")




