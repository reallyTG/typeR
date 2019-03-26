library(efts)


### Name: get_start_date
### Title: Retrieves the first date of the time dimension from a netCDF
###   file
### Aliases: get_start_date

### ** Examples


x <- "hours since 2015-10-04 00:00:00 +1023"
get_start_date(x)
get_start_date(x,time_zone = 'UTC')
get_start_date(x,time_zone = 'Australia/Perth')
get_start_date(x,time_zone = 'Australia/Canberra')




