library(timsac)


### Name: covgen
### Title: Covariance Generation
### Aliases: covgen
### Keywords: ts

### ** Examples

spec <- raspec(h = 100, var = 1, arcoef = c(0.64,-0.8), plot = FALSE)
covgen(lag = 100, f = 0:100/200, gain = spec)



