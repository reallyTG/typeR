library(fUnitRoots)


### Name: UnitrootUrcaInterface
### Title: Unit Root Time Series Tests
### Aliases: UnitrootUrcaInterface urdfTest urersTest urkpssTest urppTest
###   urspTest urzaTest
### Keywords: htest

### ** Examples

## Time Series
   # A time series which contains no unit-root:
   x <- rnorm(1000)
   # A time series which contains a unit-root:
   y <- cumsum(c(0, x))

## ERS Test:
 if(require("urca")) {
   urersTest(x)
   urersTest(y)
  }



