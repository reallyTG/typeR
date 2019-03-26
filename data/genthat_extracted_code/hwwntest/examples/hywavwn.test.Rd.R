library(hwwntest)


### Name: hywavwn.test
### Title: Hybrid wavelet test of white noise.
### Aliases: hywavwn.test
### Keywords: htest ts

### ** Examples

#
# Test data
#
x <- rnorm(64)
#
# Do the test
#
answer <- hywavwn.test(x)
#
# The result in my case was:
#
#answer
#
#	Hybrid Wavelet Test of White Noise
#
#data:  
#p-value = 0.02305



