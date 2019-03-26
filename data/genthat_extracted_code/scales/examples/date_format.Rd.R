library(scales)


### Name: date_format
### Title: Formatted dates and times.
### Aliases: date_format time_format

### ** Examples

a_time <- ISOdatetime(2012, 1, 1, 11, 30, 0, tz = "UTC")
a_date <- as.Date(a_time)

date_format()(a_date)
date_format(format = "%A")(a_date)

time_format()(a_time)
time_format(tz = "Europe/Berlin")(a_time)

a_hms <- hms::as.hms(a_time, tz = "UTC")
time_format(format = "%H:%M")(a_hms)



