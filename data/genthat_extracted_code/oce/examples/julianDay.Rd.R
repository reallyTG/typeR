library(oce)


### Name: julianDay
### Title: Convert a POSIXt time to a Julian day
### Aliases: julianDay

### ** Examples


t <- ISOdatetime(1977, 4, 26, hour=0, min=0, sec=0, tz="UTC")+0.4*86400
expect_equal(julianDay(t), 2443259.9) # example from Meeus




