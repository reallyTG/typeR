library(timetk)


### Name: tk_index
### Title: Extract an index of date or datetime from time series objects,
###   models, forecasts
### Aliases: tk_index tk_index has_timetk_idx

### ** Examples

library(tidyverse)
library(timetk)

# Create time-based tibble
data_tbl <- tibble::tibble(
    date = seq.Date(from = as.Date("2000-01-01"), by = 1, length.out = 5),
    x    = rnorm(5) * 10,
    y    = 5:1
)
tk_index(data_tbl) # Returns time-based index vector

# Coerce to ts using tk_ts(): Preserves time-basis
data_ts <- tk_ts(data_tbl)
tk_index(data_ts, timetk_idx = FALSE) # Returns regularized index
tk_index(data_ts, timetk_idx = TRUE)  # Returns original time-based index vector

# Coercing back to tbl
tk_tbl(data_ts, timetk_idx = FALSE) # Returns regularized tbl
tk_tbl(data_ts, timetk_idx = TRUE)  # Returns time-based tbl






