library(tibbletime)


### Name: as_period
### Title: Change 'tbl_time' periodicity
### Aliases: as_period

### ** Examples


# Basic usage ---------------------------------------------------------------

# FB stock prices
data(FB)
FB <- as_tbl_time(FB, date)

# Aggregate FB to yearly data
as_period(FB, "yearly")

# Aggregate FB to every 2 years
as_period(FB, "2 years")

# Aggregate FB to yearly data, but use the last data point available
# in that period
as_period(FB, "yearly", side = "end")

# Aggregate FB to yearly data, end of period, and include the first
# endpoint
as_period(FB, "yearly", side = "end", include_endpoints = TRUE)

# Aggregate to weekly. Notice that it only uses the earliest day available
# in the data set at that periodicity. It will not set the date of the first
# row to 2013-01-01 because that date did not exist in the original data set.
as_period(FB, "weekly")

# Aggregate to every other week
as_period(FB, "2 weeks")

# FB is daily data, aggregate to minute?
# Not allowed for Date class indices, an error is thrown
# as_period(FB, "minute")

# Grouped usage -------------------------------------------------------------

# FANG contains Facebook, Amazon, Netflix and Google stock prices
data(FANG)
FANG <- as_tbl_time(FANG, date)

FANG <- dplyr::group_by(FANG, symbol)

# Respects groups
as_period(FANG, "yearly")

# Every 6 months, respecting groups
as_period(FANG, "6 months")

# Using start_date ----------------------------------------------------------


#### One method using start_date

# FB stock prices
data(FB)
FB <- as_tbl_time(FB, date)

# The Facebook series starts at 2013-01-02 so the 'every 2 day' counter
# starts at that date as well. Groups become (2013-01-02, 2013-01-03),
# (2013-01-04, 2013-01-05) and so on.
as_period(FB, "2 day")

# Specifying the `start_date = "2013-01-01"` might be preferable.
# Groups become (2013-01-01, 2013-01-02), (2013-01-03, 2013-01-04) and so on.
as_period(FB, "2 day", start_date = "2013-01-01")

#### Equivalent method using an index vector

# FB stock prices
data(FB)
FB <- as_tbl_time(FB, date)

custom_period <- create_series(
  time_formula = dplyr::first(FB$date) - 1 ~ dplyr::last(FB$date),
  period       = "2 day",
  class        = "Date",
  as_vector    = TRUE)

FB %>%
  as_tbl_time(date) %>%
  as_period(period = custom_period)

# Manually calculating returns at different periods -------------------------

data(FB)

# Annual Returns
# Convert to end of year periodicity, but include the endpoints to use as
# a reference for the first return calculation. Then calculate returns.
FB %>%
  as_tbl_time(date) %>%
  as_period("1 y", side = "end", include_endpoints = TRUE) %>%
  dplyr::mutate(yearly_return = adjusted / dplyr::lag(adjusted) - 1)




