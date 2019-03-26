library(timetk)


### Name: tk_xts
### Title: Coerce time series objects and tibbles with date/date-time
###   columns to xts.
### Aliases: tk_xts tk_xts_

### ** Examples

library(tidyverse)
library(timetk)

### tibble to xts: Comparison between tk_xts() and xts::xts()
data_tbl <- tibble::tibble(
    date = seq.Date(as.Date("2016-01-01"), by = 1, length.out = 5),
    x    = rep("chr values", 5),
    y    = cumsum(1:5),
    z    = cumsum(11:15) * rnorm(1))

# xts: Character columns cause coercion issues; order.by must be passed a vector of dates
xts::xts(data_tbl[,-1], order.by = data_tbl$date)

# tk_xts: Non-numeric columns automatically dropped; No need to specify date column
tk_xts(data_tbl)

# ts can be coerced back to xts
data_tbl %>%
    tk_ts(start = 2016, freq = 365) %>%
    tk_xts()

### Using select and date_var
tk_xts(data_tbl, select = y, date_var = date)


### NSE: Enables programming
date_var <- "date"
select   <- "y"
tk_xts_(data_tbl, select = select, date_var = date_var)




