library(tsoutliers)


### Name: outliers.tstatistics
### Title: Test Statistics for the Significance of Outliers
### Aliases: outliers.tstatistics
### Keywords: ts

### ** Examples

# given an ARIMA model detect potential outliers
# for a critical value equal to 3.5
data("hicp")
y <- log(hicp[["011600"]])
fit <- arima(y, order = c(1, 1, 0), seasonal = list(order = c(2, 0, 2)))
resid <- residuals(fit)
pars <- coefs2poly(fit)
tstats <- outliers.tstatistics(pars, resid)
# potential observations affected by an additive outliers
which(abs(tstats[,"AO","tstat"]) > 3.5)
# potential observations affected by a temporary change
which(abs(tstats[,"TC","tstat"]) > 3.5)
# potential observations affected by a level shift
which(abs(tstats[,"LS","tstat"]) > 3.5)



