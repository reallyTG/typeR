library(mtconnectR)


### Name: convert_interval_to_ts
### Title: Convert Interval to Time Series
### Aliases: convert_interval_to_ts

### ** Examples

test_interval =
  data.frame(start = as.POSIXct(c(0.5, 1, 1.008, 1.011),  tz = 'CST6CDT', origin = "1970-01-01"),
             end   = as.POSIXct(c(1, 1.008, 1.011, 2),  tz = 'CST6CDT', origin = "1970-01-01"),
             duration = c(0.50, 0.01, 0.00, 0.99),
             y     = c("e", "e", "e", "f"))
convert_interval_to_ts(test_interval)



