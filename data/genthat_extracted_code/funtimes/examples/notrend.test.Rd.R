library(funtimes)


### Name: notrend.test
### Title: Sieve Bootstrap Based Test for the Null Hypothesis of no Trend
### Aliases: notrend.test
### Keywords: htest trend ts

### ** Examples

## Not run: 
##D # Fix seed for reproducible simulations:
##D set.seed(1)
##D 
##D #Simulate autoregressive time series of length n with smooth linear trend:
##D n <- 200
##D tsTrend <- 1 + 2*(1:n/n)
##D tsNoise <- arima.sim(n = n, list(order = c(2, 0, 0), ar = c(0.5, -0.1)))
##D U <- tsTrend + tsNoise
##D plot.ts(U)
##D     
##D #Use t-test
##D notrend.test(U)
##D     
##D #Use Mann-Kendall test and Yule-Walker estimates of the AR parameters
##D notrend.test(U, test = "MK", ar.method = "yw")
##D     
##D #Use WAVK test for the H0 of no trend, with m-out-of-n selection of the local window:
##D notrend.test(U, test = "WAVK", factor.length = "adaptive.selection")
##D # Sample output:
##D ##	Sieve-bootstrap WAVK trend test
##D ##
##D ##data:  U
##D ##WAVK test statistic = 21.654, moving window = 15, p-value < 2.2e-16
##D ##alternative hypothesis: (non-)monotonic trend.
##D ##sample estimates:
##D ##$AR_order
##D ##[1] 1
##D ##
##D ##$AR_coefficients
##D ##    phi_1 
##D ##0.4041848 
## End(Not run)




