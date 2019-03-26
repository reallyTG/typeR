library(fUnitRoots)


### Name: UnitrootTests
### Title: Unit Root Time Series Tests
### Aliases: UnitrootTests unitrootTest adfTest
### Keywords: htest

### ** Examples

## Time Series 
   # A time series which contains no unit-root:
   x = rnorm(1000)  
   # A time series which contains a unit-root:
   y = cumsum(c(0, x))
   
## adfTest - 
   adfTest(x)
   adfTest(y)
   
## unitrootTest - 
   unitrootTest(x)
   unitrootTest(y)     



