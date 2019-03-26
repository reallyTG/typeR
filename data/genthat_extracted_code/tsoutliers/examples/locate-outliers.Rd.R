library(tsoutliers)


### Name: locate.outliers
### Title: Stage I of the Procedure: Locate Outliers (Baseline Function)
### Aliases: locate.outliers
### Keywords: ts

### ** Examples

data("hicp")
y <- log(hicp[["011600"]])
fit <- arima(y, order = c(1, 1, 0), seasonal = list(order = c(2, 0, 2)))
resid <- residuals(fit)
pars <- coefs2poly(fit)
outliers <- locate.outliers(resid, pars)
outliers



