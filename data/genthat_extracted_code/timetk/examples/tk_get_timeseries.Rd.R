library(timetk)


### Name: tk_get_timeseries
### Title: Get summary attributes from a time-series index
### Aliases: tk_get_timeseries tk_get_timeseries_signature
###   tk_get_timeseries_summary

### ** Examples

library(tidyquant)
library(timetk)

# Works with time-based tibbles
FB_tbl <- FANG %>% filter(symbol == "FB")
FB_idx <- tk_index(FB_tbl)

tk_get_timeseries_signature(FB_idx)
tk_get_timeseries_summary(FB_idx)


# Works with dates in any periodicity
idx_weekly <- seq.Date(from = ymd("2016-01-01"), by = 'week', length.out = 6)

tk_get_timeseries_signature(idx_weekly)
tk_get_timeseries_summary(idx_weekly)


# Works with zoo yearmon and yearqtr classes
idx_yearmon <- seq.Date(from       = ymd("2016-01-01"),
                        by         = "month",
                        length.out = 12) %>%
    as.yearmon()

tk_get_timeseries_signature(idx_yearmon)
tk_get_timeseries_summary(idx_yearmon)




