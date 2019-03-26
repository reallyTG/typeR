## ----setup, include=FALSE, message=FALSE, results='hide'-----------------
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_chunk$set(message = FALSE)
# knitr::opts_chunk$set(results = 'hide')

## ---- echo = F, out.width = "690px"--------------------------------------
knitr::include_graphics("comparison_simtimer_vs_regular_time.jpg")

## ------------------------------------------------------------------------
library(simtimer)
origin_date <- lubridate::ymd_hms("2017-01-01 00:00:00", tz = "UTC")
my_datetime <- c(lubridate::ymd_hms("2017-01-01 02:00:00", tz = "UTC"), 
                 lubridate::ymd_hms("2017-02-27 20:53:20", tz = "UTC"),
                 lubridate::ymd_hms("2017-08-20 11:33:20", tz = "UTC"),
                 lubridate::ymd_hms("2018-01-06 08:53:20", tz = "UTC"))
my_sim_datetime <- as.sim_datetime(my_datetime, origin_date)
my_sim_datetime
class(my_sim_datetime)

## ------------------------------------------------------------------------
as.datetime(my_sim_datetime, origin_date)

## ------------------------------------------------------------------------
sim_time(my_sim_datetime)

## ------------------------------------------------------------------------
sim_wday(my_sim_datetime, origin_date)

## ------------------------------------------------------------------------
sim_date(my_sim_datetime)

