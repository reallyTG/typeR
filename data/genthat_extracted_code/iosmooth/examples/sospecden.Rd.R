library(iosmooth)


### Name: sospecden
### Title: Second order spectral density estimation using an infinite order
###   pilot
### Aliases: sospecden
### Keywords: Spectral Density Plug-in bandwidth Flat-top kernel

### ** Examples

x <- arima.sim(list(ar=.7, ma=-.3), 100)
bwplot(x)
plot(sospecden(x), type="l")



