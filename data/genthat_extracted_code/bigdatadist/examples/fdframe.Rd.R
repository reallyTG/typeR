library(bigdatadist)


### Name: fdframe
### Title: Functional Data Frame
### Aliases: fdframe fdframe.default
### Keywords: multivariate time series formatting.

### ** Examples

t = 1:10; Y = cbind(sin(t),cos(t))
fdata = fdframe(t,Y)
plot(fdata, xlab='Time', ylab='')



