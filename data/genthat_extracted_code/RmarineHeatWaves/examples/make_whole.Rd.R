library(RmarineHeatWaves)


### Name: make_whole
### Title: Constructs a Continuous, Uninterrupted Time Series of
###   Temperatures.
### Aliases: make_whole

### ** Examples

require(dplyr); require(tidyr); require(lubridate)
ts_dat <- make_whole(sst_WA) # default columns "t" and "temp", in that order
clim_start <- "1983-01-01"
clim_end <- "2012-12-31"
ts_dat %>%
filter(t >= clim_start & t <= clim_end) %>%
  mutate(t = year(t)) %>%
  spread(t, temp) %>%
  filter(doy >= 55 & doy <= 65)



