library(funtimes)


### Name: wavk.test
### Title: WAVK Trend Test
### Aliases: wavk.test
### Keywords: htest trend ts

### ** Examples

# Fix seed for reproducible simulations:
set.seed(1)

#Simulate autoregressive time series of length n with smooth quadratic trend:
n <- 100
tsTrend <- 1 + 2*(1:n/n) + 4*(1:n/n)^2
tsNoise <- arima.sim(n = n, list(order = c(2, 0, 0), ar = c(-0.7, -0.1)))
U <- tsTrend + tsNoise
plot.ts(U)

#Test H0 of a linear trend, with m-out-of-n selection of the local window:
## Not run: 
##D     wavk.test(U ~ t, factor.length = "adaptive.selection")
## End(Not run)
# Sample output:
##	Trend test by Wang, Akritas, and Van Keilegom (bootstrap p-values)
##
##data:  U 
##WAVK test statistic = 5.3964, adaptively selected window = 4, p-value < 2.2e-16
##alternative hypothesis: trend is not of the form U ~ t.

#Test H0 of a quadratic trend, with m-out-of-n selection of the local window 
#and output of all results:
## Not run: 
##D     wavk.test(U ~ poly(t, 2), factor.length = "adaptive.selection", out = TRUE)
## End(Not run)
# Sample output:
##	Trend test by Wang, Akritas, and Van Keilegom (bootstrap p-values)
##
##data:  U 
##WAVK test statistic = 0.40083, adaptively selected window = 4, p-value = 0.576
##alternative hypothesis: trend is not of the form U ~ poly(t, 2).
##sample estimates:
##$trend_coefficients
##(Intercept) poly(t, 2)1 poly(t, 2)2 
##   3.408530   17.681422    2.597213 
##
##$AR_order
##[1] 1
##
##$AR_coefficients
##         phi_1 
##[1] -0.7406163
##
##$all_considered_windows
## Window WAVK-statistic p-value
##      4     0.40083181   0.576
##      5     0.06098625   0.760
##      7    -0.57115451   0.738
##     10    -1.02982929   0.360

# Test H0 of no trend (constant trend) using asymptotic distribution of statistic.
wavk.test(U ~ 1, method = "asympt")
# Sample output:
##	Trend test by Wang, Akritas, and Van Keilegom (asymptotic p-values)
##
##data:  U 
##WAVK test statistic = 25.999, user-defined window = 10, p-value < 2.2e-16
##alternative hypothesis: trend is not of the form U ~ 1.




