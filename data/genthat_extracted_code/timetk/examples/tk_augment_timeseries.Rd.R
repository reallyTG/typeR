library(timetk)


### Name: tk_augment_timeseries
### Title: Augment the time series signature to the data
### Aliases: tk_augment_timeseries tk_augment_timeseries_signature

### ** Examples

library(tidyquant)
library(timetk)

FANG %>%
    filter(symbol == "FB") %>%
    tk_augment_timeseries_signature()




