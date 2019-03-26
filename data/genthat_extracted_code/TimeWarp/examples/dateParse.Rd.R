library(TimeWarp)


### Name: dateParse
### Title: Date Construction from Character Vectors
### Aliases: dateParse
### Keywords: utilities

### ** Examples

dateParse("2001-02-14")
dateParse("2/14/2002")
dateParse(c("1962/06/20", "1962/10/30","NA"))
dateParse(c("19620620", "19621030", "NA"), ymd8 = TRUE)
dateParse(factor(c("2001/01/01", "2001/01/03", "2001/01/01")))
# Possibly unexpected values in conversion from POSIXct to Date
Sys.setenv('TZ'='EST')
x <- as.POSIXct('2011-12-10 16:55:26 EST')+(0:9)*3600
# Date rolls to the next day after 19:00 hours for EST
# (because that it the time the next day is dawning in UTC)
data.frame(x, as.Date(x))
# This is the way to get as.Date() to do the sensible thing
data.frame(x, as.Date(x, tz='EST'))



