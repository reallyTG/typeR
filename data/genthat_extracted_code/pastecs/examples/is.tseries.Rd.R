library(pastecs)


### Name: is.tseries
### Title: Is this object a time series?
### Aliases: is.tseries
### Keywords: ts

### ** Examples

tser <- ts(sin((1:100)/6*pi)+rnorm(100, sd=0.5), start=c(1998, 4), frequency=12)
is.tseries(tser)      # TRUE
not.a.ts <- c(1,2,3)
is.tseries(not.a.ts)  # FALSE



