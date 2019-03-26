library(tsoutliers)


### Name: locate.outliers.loops
### Title: Stage I of the Procedure: Locate Outliers (Loop Around
###   Functions)
### Aliases: locate.outliers.oloop locate.outliers.iloop
### Keywords: ts

### ** Examples

# additional outliers may be detected in the inner or outlier loops
# in this case, the inner does not find further potential outliers 
# and stops in the first iteration, while the outer loop detects 
# a new outlier
data("hicp")
y <- log(hicp[["011600"]])
fit <- arima(y, order = c(1, 1, 0), seasonal = list(order = c(2, 0, 2)))
resid <- residuals(fit)
pars <- coefs2poly(fit)
otypes <- c("AO", "LS", "TC")
mo0 <- locate.outliers(resid, pars, types = otypes)
mo0
mo1 <- locate.outliers.iloop(resid, pars, types = otypes)
mo1
mo2 <- locate.outliers.oloop(y, fit, types = otypes)
mo2$iter
mo2$outliers



