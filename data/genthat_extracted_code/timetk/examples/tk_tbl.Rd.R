library(timetk)


### Name: tk_tbl
### Title: Coerce time-series objects to tibble.
### Aliases: tk_tbl

### ** Examples

library(tidyverse)
library(timetk)

data_tbl <- tibble(
    date = seq.Date(from = as.Date("2010-01-01"), by = 1, length.out = 5),
    x    = seq(100, 120, by = 5)
)


### ts to tibble: Comparison between as.data.frame() and tk_tbl()
data_ts <- tk_ts(data_tbl, start = c(2010,1), freq = 365)

# No index
as.data.frame(data_ts)

# Defualt index returned is regularized numeric index
tk_tbl(data_ts)

# Original date index returned (Only possible if original data has time-based index)
tk_tbl(data_ts, timetk_idx = TRUE)


### xts to tibble: Comparison between as.data.frame() and tk_tbl()
data_xts <- tk_xts(data_tbl)

# Dates are character class stored in row names
as.data.frame(data_xts)

# Dates are appropriate date class and within the data frame
tk_tbl(data_xts)


### zooreg to tibble: Comparison between as.data.frame() and tk_tbl()
data_zooreg <- tk_zooreg(1:8, start = zoo::yearqtr(2000), frequency = 4)

# Dates are character class stored in row names
as.data.frame(data_zooreg)

# Dates are appropriate zoo yearqtr class within the data frame
tk_tbl(data_zooreg)


### zoo to tibble: Comparison between as.data.frame() and tk_tbl()
data_zoo <- zoo::zoo(1:12, zoo::yearmon(2016 + seq(0, 11)/12))

# Dates are character class stored in row names
as.data.frame(data_zoo)

# Dates are appropriate zoo yearmon class within the data frame
tk_tbl(data_zoo)







