library(sarima)


### Name: acfIidTest
### Title: Carry out IID tests using sample autocorrelations
### Aliases: acfIidTest acfIidTest-methods acfIidTest,ANY-method
###   acfIidTest,missing-method acfIidTest,SampleAutocorrelations-method
### Keywords: ts htest

### ** Examples

ts1 <- rnorm(100)

a1 <- drop(acf(ts1)$acf)
acfIidTest(a1, n = 100, nlags = c(5, 10, 20))
acfIidTest(a1, n = 100, nlags = c(5, 10, 20), method = "LjungBox")
acfIidTest(a1, n = 100, nlags = c(5, 10, 20), interval = NULL)
acfIidTest(a1, n = 100, method = "LjungBox", interval = c(0.95, 0.90), expandCI = FALSE)


## acfIidTest() is called behind the scenes by methods for autocorrelation objects
ts1_acrf <- autocorrelations(ts1)
class(ts1_acrf)  # "SampleAutocorrelations"
whiteNoiseTest(ts1_acrf, h0 = "iid", nlags = c(5,10,20), method = "LiMcLeod")
plot(ts1_acrf)

## use 10% level of significance in the plot:
plot(ts1_acrf, interval = 0.9)



