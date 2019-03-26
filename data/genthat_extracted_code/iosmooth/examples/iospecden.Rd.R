library(iosmooth)


### Name: iospecden
### Title: Spectral density estimation with infinite order kernels
### Aliases: iospecden
### Keywords: Spectral Density Flat-top kernel

### ** Examples

x <- arima.sim(list(ar=.7, ma=-.3), 100)
bwplot(x)
plot(iospecden(x), type="l")



