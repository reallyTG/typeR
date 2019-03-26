library(timetk)


### Name: tk_ts
### Title: Coerce time series objects and tibbles with date/date-time
###   columns to ts.
### Aliases: tk_ts tk_ts_

### ** Examples

library(tidyverse)
library(timetk)

### tibble to ts: Comparison between tk_ts() and stats::ts()
data_tbl <- tibble::tibble(
    date = seq.Date(as.Date("2016-01-01"), by = 1, length.out = 5),
    x    = rep("chr values", 5),
    y    = cumsum(1:5),
    z    = cumsum(11:15) * rnorm(1))

# as.ts: Character columns introduce NA's; Result does not retain index
stats::ts(data_tbl[,-1], start = 2016)

# tk_ts: Only numeric columns get coerced; Result retains index in numeric format
data_ts <- tk_ts(data_tbl, start = 2016)
data_ts

# timetk index
tk_index(data_ts, timetk_idx = FALSE)   # Regularized index returned
tk_index(data_ts, timetk_idx = TRUE)    # Original date index returned

# Coerce back to tibble
data_ts %>% tk_tbl(timetk_idx = TRUE)


### Using select
tk_ts(data_tbl, select = y)


### NSE: Enables programming
select   <- "y"
tk_ts_(data_tbl, select = select)




