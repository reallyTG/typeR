library(dsa)


### Name: Scaler
### Title: Take logs and differences of a time series
### Aliases: Scaler

### ** Examples

a = ts(rnorm(100, 100, 10), start=c(2015,1), frequency=12)
Scaler(a, Diff=1, Log=TRUE)



