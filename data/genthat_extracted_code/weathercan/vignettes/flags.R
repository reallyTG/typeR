## ---- include = FALSE, message = FALSE-----------------------------------
library(weathercan)
library(dplyr)

## ---- echo = FALSE--------------------------------------------------------------------------------
options(width = 100)
w <- weather_dl(station_id = 5401, start =  "2017-01-01", interval = "month", format = FALSE)

dplyr::select(w, station_name, `Date/Time`, `Total Precip (mm)`, `Total Precip Flag`) %>% tail()
dplyr::select(w, station_name, `Date/Time`, `Snow Grnd Last Day (cm)`, `Snow Grnd Last Day Flag`) %>% tail()

## ---- echo = FALSE--------------------------------------------------------------------------------

weather_dl(station_id = 5401, start =  "2017-01-01", interval = "month") %>%
  dplyr::select(date, total_precip, total_precip_flag, snow_grnd_last_day, snow_grnd_last_day_flag) %>%
  tail()

## ---- echo = FALSE--------------------------------------------------------------------------------
knitr::kable(flags)

