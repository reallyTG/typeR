library(fracdiff)


### Name: fracdiff.var
### Title: Recompute Covariance Estimate for fracdiff
### Aliases: fracdiff.var
### Keywords: ts

### ** Examples

## Generate a fractionally-differenced ARIMA(1,d,1) model :
ts.test <- fracdiff.sim(10000, ar = .2, ma = .4, d = .3)
## estimate the parameters in an ARIMA(1,d,1) model for the simulated series
fd.out <- fracdiff(ts.test$ser, nar= 1, nma = 1)

## Modify the covariance estimate by changing the finite-difference interval
(fd.o2 <- fracdiff.var(ts.test$series, fd.out, h = .0001))
## looks identical as  print(fd.out),
## however these (e.g.) differ :
vcov(fd.out)
vcov(fd.o2)



