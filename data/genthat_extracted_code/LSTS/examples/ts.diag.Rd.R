library(LSTS)


### Name: ts.diag
### Title: Diagnostic Plots for Time Series fits
### Aliases: ts.diag
### Keywords: diagnostic ljung acf residuals timeseries

### ** Examples

z = rnorm(500)
Box.Ljung.Test(z, lag=15)
ts.diag(z)



