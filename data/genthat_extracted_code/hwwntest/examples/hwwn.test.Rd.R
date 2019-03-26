library(hwwntest)


### Name: hwwn.test
### Title: Perform a test for white noise on a time series.
### Aliases: hwwn.test
### Keywords: htest ts

### ** Examples

#
# Invent test data set which IS white noise
#
x <- rnorm(128)
#
# Do the test
#
x.wntest <- hwwn.test(x)
#
# Print the results
#
#x.wntest
#
#	Wavelet Test of White Noise
#
#data:  
#p-value = 0.9606
#
# So p-value indicates that there is no evidence for rejection of
# H_0: white noise.
#
# Let's do an example using data that is not white noise. E.g. AR(1)
#
x.ar <- arima.sim(n=128, model=list(ar=0.8))
#
# Do the test
#
x.ar.wntest <- hwwn.test(x.ar)
#
# Print the results
#
print(x.ar.wntest)
#
#	Wavelet Test of White Noise
#
#data:  
#p-value < 2.2e-16
#
# p-value is very small. Extremely strong evidence to reject H_0: white noise



