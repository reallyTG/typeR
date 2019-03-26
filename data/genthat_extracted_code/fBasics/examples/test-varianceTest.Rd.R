library(fBasics)


### Name: varianceTest
### Title: Two Sample Variance Tests
### Aliases: varianceTest
### Keywords: htest

### ** Examples

## rnorm - 
   # Generate Series:
   x = rnorm(50)
   y = rnorm(50)
   
## varianceTest -
   varianceTest(x, y, "varf")
   varianceTest(x, y, "bartlett")
   varianceTest(x, y, "fligner")



