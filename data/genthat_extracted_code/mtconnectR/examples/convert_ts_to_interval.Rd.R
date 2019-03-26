library(mtconnectR)


### Name: convert_ts_to_interval
### Title: Convert Time Series to Intervals
### Aliases: convert_ts_to_interval

### ** Examples

ts_data = data.frame(ts = as.POSIXct(c(0.5, 1, 1.008, 1.011),  tz = 'UTC', origin = "1970-01-01"),
                     x = c("a", "b", "c", "d"), y = c("e", "e", "e", "f"))
convert_ts_to_interval(ts_data, time_colname = "ts", endtime_lastrow = ts_data$ts[1] + 10)



