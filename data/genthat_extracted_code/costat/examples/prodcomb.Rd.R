library(costat)


### Name: prodcomb
### Title: Combine two time series using a time-varying linear combination.
### Aliases: prodcomb
### Keywords: ts

### ** Examples

#
# Toy example
#
tmp.a <- c(1, -1)
tmp.b <- c(0.5, 0.5)
#
# Generate toy time series
#
xxx <- rnorm(256)
yyy <- rnorm(256)
#
# Combine xxx and yyy using the functions produced by inverse wavelet
# transform of tmp.a and tmp.b
#
## Not run: tmp <- prodcomb(c(tmp.a, tmp.b), tsx=xxx, tsy=yyy)
#
# E.g. plot combination
#
## Not run: ts.plot(tmp)
#
# Potentially test its stationarity.... etc
#



