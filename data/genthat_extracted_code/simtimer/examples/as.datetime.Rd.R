library(simtimer)


### Name: as.datetime
### Title: Back-transformation from a sim_datetime to a datetime
### Aliases: as.datetime

### ** Examples

origin_date <- lubridate::ymd_hms("2016-01-01 00:00:00")
as.datetime(60, origin_date)
# [1] "2016-01-01 00:01:00 UTC"
as.datetime(600, origin_date)
# [1] "2016-01-01 00:10:00 UTC"
as.datetime(as.sim_datetime(lubridate::ymd_hms("2016-01-02 00:00:00"), origin_date), origin_date)
# [1] "2016-01-02 UTC"



