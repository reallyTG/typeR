library(efts)


### Name: find_utc_offset
### Title: Finds the UTC offset in a date-time string
### Aliases: find_utc_offset

### ** Examples


x <- "hours since 2015-10-04 00:00:00 +1023"
find_utc_offset(x)
find_utc_offset(x, FALSE)
x <- "hours since 2015-10-04 00:00:00 -0837"
find_utc_offset(x)
find_utc_offset(x, FALSE)    
x <- "hours since 2015-10-04 00:00:00"
find_utc_offset(x)
find_utc_offset(x, FALSE)




