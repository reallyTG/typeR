library(iosmooth)


### Name: bwplot.ts
### Title: Bandwidth plot for spectral density estimation
### Aliases: bwplot.ts
### Keywords: Spectral Density Flat-top kernel Smoothing parameter

### ** Examples

set.seed(123)
x <- arima.sim(list(ar=.7, ma=-.3), 100)
bwplot(x)
bwadap(x)
# Choose a smoothing parameter of 3
plot(iospecden(x, l=3), type="l")



