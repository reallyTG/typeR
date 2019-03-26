library(funtimes)


### Name: sync.test
### Title: Time Series Trend Synchronism Test
### Aliases: sync.test
### Keywords: htest synchrony trend ts

### ** Examples

#Fix seed for reproducible simulations:
set.seed(1)

# Simulate two autoregressive time series of length n without trend 
#(i.e., with zero or constant trend) 
# and arrange the series into a matrix:
n <- 200
y1 <- arima.sim(n = n, list(order = c(1, 0, 0), ar = c(0.6)))
y2 <- arima.sim(n = n, list(order = c(1, 0, 0), ar = c(-0.2)))
Y <- cbind(y1, y2)
plot.ts(Y)


#Test H0 of a common linear trend:
## Not run: 
##D     sync.test(Y ~ t, B = 500)
## End(Not run)
# Sample output:
##	Non-parametric test for synchronism of parametric trends
##
##data:  Y 
##Test statistic = -0.0028999, p-value = 0.7
##alternative hypothesis: common trend is not of the form Y ~ t.
##sample estimates:
##$common_trend_estimates
##               Estimate Std. Error    t value  Pr(>|t|)
##(Intercept) -0.02472566  0.1014069 -0.2438261 0.8076179
##t            0.04920529  0.1749859  0.2811958 0.7788539
##
##$ar.order_used
##         y1 y2
##ar.order  1  1
##
##$Window_used
##       y1 y2
##Window 15  8
##
##$all_considered_windows
## Window    Statistic p-value Asympt. p-value
##      8 -0.000384583   0.728       0.9967082
##     11 -0.024994408   0.860       0.7886005
##     15 -0.047030164   0.976       0.6138976
##     20 -0.015078579   0.668       0.8714980
##
##$wavk_obs
##[1]  0.05827148 -0.06117136

# Add a time series y3 with a different linear trend and re-apply the test:
y3 <- 1 + 3*((1:n)/n) + arima.sim(n = n, list(order = c(1, 0, 0), ar = c(-0.2)))
Y2 <- cbind(Y, y3)
plot.ts(Y2)
## Not run: 
##D     sync.test(Y2 ~ t, B = 500)
## End(Not run)
# Sample output:
##	Non-parametric test for synchronism of parametric trends
##
##data:  Y2 
##Test statistic = 0.48579, p-value < 2.2e-16
##alternative hypothesis: common trend is not of the form Y2 ~ t.
##sample estimates:
##$common_trend_estimates
##              Estimate Std. Error  t value     Pr(>|t|)
##(Intercept) -0.3632963 0.07932649 -4.57976 8.219360e-06
##t            0.7229777 0.13688429  5.28167 3.356552e-07
##
##$ar.order_used
##         Y.y1 Y.y2 y3
##ar.order    1    1  0
##
##$Window_used
##       Y.y1 Y.y2 y3
##Window    8   11  8
##
##$all_considered_windows
## Window Statistic p-value Asympt. p-value
##      8 0.4930069       0    1.207378e-05
##     11 0.5637067       0    5.620248e-07
##     15 0.6369703       0    1.566057e-08
##     20 0.7431621       0    4.201484e-11
##
##$wavk_obs
##[1]  0.08941797 -0.07985614  0.34672734

#Other hypothesized trend forms can be specified, for example:
## Not run: 
##D     sync.test(Y ~ 1) #constant trend
##D     sync.test(Y ~ poly(t, 2)) #quadratic trend
##D     sync.test(Y ~ poly(t, 3)) #cubic trend
## End(Not run)




