library(dsa)


### Name: Descaler
### Title: Invert taking logs and differences of a time series
### Aliases: Descaler

### ** Examples

a = ts(rnorm(100, 100, 10), start=c(2015,1), frequency=12)
b = Scaler(a, Diff=1, Log=TRUE)
Descaler(b,a, Diff=1, Log=TRUE)



