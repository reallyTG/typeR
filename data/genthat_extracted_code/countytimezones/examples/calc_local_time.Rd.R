library(countytimezones)


### Name: calc_local_time
### Title: Calculate local time from UTC for US counties
### Aliases: calc_local_time

### ** Examples

calc_local_time(date_time = "1999-01-01 08:00", fips = "36061")

ex_datetime <- c("1999-01-01 08:00", "1999-01-01 09:00",
                 "1999-01-01 10:00")
calc_local_time(date_time = ex_datetime, fips = "36061")

ex_datetime <- c("1999-01-01 08:00", "1999-01-01 09:00",
                 "1999-01-01 10:00")
ex_fips <- c("36061", "17031", "06037")
calc_local_time(date_time = ex_datetime, fips = ex_fips)




