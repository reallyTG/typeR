library(simtimer)


### Name: sim_date
### Title: Date part of a sim_datetime
### Aliases: sim_date

### ** Examples

sim_date(24*60*60-1)
# [1] 0
sim_date(24*60*60)
# [1] 1
sim_date(452*24*60*60)
# [1] 452
origin_date <- lubridate::ymd_hms("2016-01-01 00:00:00")
sim_date(as.sim_datetime(lubridate::ymd_hms("2016-01-02 00:01:00"), origin_date))
# [1] 1



