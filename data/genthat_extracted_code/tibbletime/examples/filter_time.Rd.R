library(tibbletime)


### Name: filter_time
### Title: Succinctly filter a 'tbl_time' object by its index
### Aliases: filter_time [.tbl_time

### ** Examples


# FANG contains Facebook, Amazon, Netflix and Google stock prices
data(FANG)
FANG <- as_tbl_time(FANG, date) %>%
  dplyr::group_by(symbol)

# 2013-01-01 to 2014-12-31
filter_time(FANG, '2013' ~ '2014')

# 2013-05-25 to 2014-06-04
filter_time(FANG, '2013-05-25' ~ '2014-06-04')

# Using the `[` subset operator
FANG['2014'~'2015']

# Using `[` and one sided formula for only dates in 2014
FANG[~'2014']

# Using `[` and column selection
FANG['2013'~'2016', c("date", "adjusted")]

# Variables are unquoted using rlang
lhs_date <- "2013"
rhs_date <- as.Date("2014-01-01")
filter_time(FANG, lhs_date ~ rhs_date)

# Use the keywords 'start' and 'end' to conveniently access ends
filter_time(FANG, 'start' ~ '2014')

# hms (hour, minute, second) classes have special parsing
hms_example <- create_series(~'12:01', 'second', class = 'hms')
filter_time(hms_example, 'start' ~ '12:01:30')





