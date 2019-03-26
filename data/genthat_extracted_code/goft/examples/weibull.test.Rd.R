library(goft)


### Name: weibull_test
### Title: Test for the Weibull distribution
### Aliases: weibull_test
### Keywords: htest

### ** Examples

# Testing the Weibull distribution hypothesis on the maximum ozone levels given
# in the o3max data set.
data(o3max)
x <- o3max[ ,2]     # maximum ozone levels
weibull_test(x, N = 10000)     



