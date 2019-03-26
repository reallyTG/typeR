library(ETAS)


### Name: date2day
### Title: Convert date-time data to numeric data in decimal days
### Aliases: date2day
### Keywords: spatial math date time

### ** Examples

  # date-time data of Iran's earthquakes between 1973/01/01 and 2016/01/01
  dt <- paste(iran.quakes$date, iran.quakes$time)
  # origin of the conversion
  start <- "1973/01/01 00:00:00"
  # time in days since 1973-01-01 (UTC)
  date2day(dt, start, tz="GMT")



