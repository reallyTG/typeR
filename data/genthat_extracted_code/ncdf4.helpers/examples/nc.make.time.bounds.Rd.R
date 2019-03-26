library(ncdf4.helpers)


### Name: nc.make.time.bounds
### Title: Creates time bounds for a time series
### Aliases: nc.make.time.bounds

### ** Examples

library(PCICt)
ts <- as.PCICt(c("1961-01-15", "1961-02-15", "1961-03-15"), cal="360")
ts.bounds <- nc.make.time.bounds(ts, unit="month")



