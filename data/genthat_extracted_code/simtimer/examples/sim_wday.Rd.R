library(simtimer)


### Name: sim_wday
### Title: Weekday part of a sim_datetime
### Aliases: sim_wday

### ** Examples

origin_date <- lubridate::ymd_hms("2016-01-01 00:00:00")
sim_wday(60, origin_date)
# [1] "Fri" # depending on your Sys.getlocale()
sim_wday(as.sim_datetime(lubridate::ymd_hms("2016-01-01 00:01:00"), origin_date), origin_date)
# [1] "Fri" # depending on your Sys.getlocale()
sim_wday(as.sim_datetime(lubridate::ymd_hms("2016-01-02 00:01:00"), origin_date), origin_date)
# [1] "Sat" # depending on your Sys.getlocale()



