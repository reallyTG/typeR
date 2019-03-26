library(simtimer)


### Name: as.sim_datetime
### Title: Transformation from a datetime to a sim_datetime
### Aliases: as.sim_datetime

### ** Examples

origin_date <- lubridate::ymd_hms("2016-01-01 00:00:00")
as.sim_datetime(lubridate::ymd_hms("2016-01-01 00:01:00"), origin_date)
# [1] 60
as.sim_datetime(lubridate::ymd_hms("2016-01-02 00:01:00"), origin_date)
# [1] 86460



