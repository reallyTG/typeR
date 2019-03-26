library(tstools)


### Name: start_ts_after_internal_nas
### Title: Start a Time Series after the Last Internal NA
### Aliases: start_ts_after_internal_nas

### ** Examples

ts1 <- 1:30
ts1[c(3,6)] <- NA
ts1 <- ts(ts1,start=c(2000,1),frequency = 4)
start_ts_after_internal_nas(ts1)



