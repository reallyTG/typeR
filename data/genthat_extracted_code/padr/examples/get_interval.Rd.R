library(padr)


### Name: get_interval
### Title: Get the interval of a datetime variable
### Aliases: get_interval

### ** Examples

x_month <- seq(as.Date('2016-01-01'), as.Date('2016-05-01'), by = 'month')
get_interval(x_month)

x_sec <- seq(as.POSIXct('2016-01-01 00:00:00'), length.out = 100, by = 'sec')
get_interval(x_sec)
get_interval(x_sec[seq(0, length(x_sec), by = 5)])



