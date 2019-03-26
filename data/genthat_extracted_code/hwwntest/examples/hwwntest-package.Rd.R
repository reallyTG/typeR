library(hwwntest)


### Name: hwwntest-package
### Title: Tests of White Noise using Wavelets
### Aliases: hwwntest-package hwwntest
### Keywords: package

### ** Examples

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
     #       Wavelet Test of White Noise
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
     #       Wavelet Test of White Noise
     #
     #data:
     #p-value < 2.2e-16
     #
     # p-value is very small. Extremely strong evidence
     # to reject H_0: white noise
     #
     #
     # Let's use one of the other tests: e.g. the general wavelet one
     #
     x.ar.genwwntest <- genwwn.test(x.ar)
     #
     # Print the results
     #
     print(x.ar.genwwntest)
     #
     #
     #  Wavelet Test of White Noise
     #
     # data:
     # p-value = 1.181e-10
     #
     # Again, p-value is very small



