library(timetk)


### Name: tk_make_future_timeseries
### Title: Make a future time series from an existing time series
### Aliases: tk_make_future_timeseries

### ** Examples

library(tidyquant)
library(timetk)

# Basic example
idx <- c("2016-01-01 00:00:00",
         "2016-01-01 00:00:03",
         "2016-01-01 00:00:06") %>%
    ymd_hms()
# Make next three dates in series
idx %>%
    tk_make_future_timeseries(n_future = 3)


# Create index of days that FB stock will be traded in 2017 based on 2016 + holidays
FB_tbl <- FANG %>% filter(symbol == "FB")
holidays <- c("2017-01-02", "2017-01-16", "2017-02-20",
              "2017-04-14", "2017-05-29", "2017-07-04",
              "2017-09-04", "2017-11-23", "2017-12-25") %>%
    ymd()
# Remove holidays with skip_values, and remove weekends with inspect_weekdays = TRUE
FB_tbl %>%
    tk_index() %>%
    tk_make_future_timeseries(n_future         = 366,
                              inspect_weekdays = TRUE,
                              skip_values      = holidays)

# Works with regularized indexes as well
c(2016.00, 2016.25, 2016.50, 2016.75) %>%
    tk_make_future_timeseries(n_future = 4)

# Works with zoo yearmon and yearqtr too
c("2016 Q1", "2016 Q2", "2016 Q3", "2016 Q4") %>%
    as.yearqtr() %>%
    tk_make_future_timeseries(n_future = 4)





