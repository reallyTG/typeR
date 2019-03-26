library(Runuran)


### Name: unuran.cont.new
### Title: Create a UNU.RAN continuous univariate distribution object
### Aliases: unuran.cont.new
### Keywords: distribution datagen

### ** Examples

## Get a distribution object with given pdf, domain and mode
mypdf <- function (x) { exp(-x) }
distr <- unuran.cont.new(pdf=mypdf, islog=FALSE, lb=0, ub=Inf, mode=0)

## This object can now be used to create an generator object.
## 1. select a method using a Runuran function:
gen <- pinvd.new(distr, uresolution=1e-12)

## 2. directly use the UNU.RAN string API
gen <- unuran.new(distr, method="pinv; u_resolution=1e-12")




