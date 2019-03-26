library(lawstat)


### Name: rjb.test
### Title: Test of Normailty - Robust Jarque Bera Test
### Aliases: rjb.test
### Keywords: htest

### ** Examples

## Normally distributed data
x = rnorm(100)
rjb.test(x)

## Sample Output
##
##        Robust Jarque Bera Test
##
## data:  x
## X-squared = 0.962, df = 2, p-value = 0.6182


## Using zuni data
data(zuni)
rjb.test(zuni[,"Revenue"])

##        Robust Jarque Bera Test
##
## data:  zuni[, "Revenue"] 
## X-squared = 54595.63, df = 2, p-value < 2.2e-16





