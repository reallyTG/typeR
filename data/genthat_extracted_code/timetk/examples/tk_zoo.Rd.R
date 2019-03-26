library(timetk)


### Name: tk_zoo
### Title: Coerce time series objects and tibbles with date/date-time
###   columns to xts.
### Aliases: tk_zoo tk_zoo_

### ** Examples

library(tidyverse)
library(timetk)

### tibble to zoo: Comparison between tk_zoo() and zoo::zoo()
data_tbl <- tibble::tibble(
    date = seq.Date(as.Date("2016-01-01"), by = 1, length.out = 5),
    x    = rep("chr values", 5),
    y    = cumsum(1:5),
    z    = cumsum(11:15) * rnorm(1))

# zoo: Characters will cause error; order.by must be passed a vector of dates
zoo::zoo(data_tbl[,-c(1,2)], order.by = data_tbl$date)

# tk_zoo: Character columns dropped with a warning; No need to specify dates (auto detected)
tk_zoo(data_tbl)

# ts can be coerced back to zoo
data_tbl %>%
    tk_ts(start = 2016, freq = 365) %>%
    tk_zoo()


### Using select and date_var
tk_zoo(data_tbl, select = y, date_var = date)


### NSE: Enables programming
date_var <- "date"
select   <- "y"
tk_zoo_(data_tbl, select = select, date_var = date_var)




