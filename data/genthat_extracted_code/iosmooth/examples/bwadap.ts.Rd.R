library(iosmooth)


### Name: bwadap.ts
### Title: Adaptive bandwidth choice for infinite order spectral density
###   estimates
### Aliases: bwadap.ts
### Keywords: Spectral Density Flat-top Kernel

### ** Examples

x <- arima.sim(list(ar=.7, ma=-.3), 100)
bwplot(x)
l <- bwadap(x)
plot(iospecden(x, l), type="l")



