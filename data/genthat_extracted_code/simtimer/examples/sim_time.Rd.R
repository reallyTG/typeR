library(simtimer)


### Name: sim_time
### Title: Time part of a sim_datetime
### Aliases: sim_time

### ** Examples

sim_time(200)
# [1] 200
sim_time(24*60*60-1)
# [1] 86399
sim_time(24*60*60)
# [1] 0
origin_date <- lubridate::ymd_hms("2016-01-01 00:00:00")
sim_time(as.sim_datetime(lubridate::ymd_hms("2016-01-01 00:01:00"), origin_date))
# [1] 60
sim_time(as.sim_datetime(lubridate::ymd_hms("2016-01-02 00:01:00"), origin_date))
# [1] 60



