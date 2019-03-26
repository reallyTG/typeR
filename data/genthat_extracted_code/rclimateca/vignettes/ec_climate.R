## ----setup, include = FALSE----------------------------------------------
library(rclimateca)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 6,
  fig.height = 4
)

## ------------------------------------------------------------------------
ec_climate_search_locations("gatineau")

## ------------------------------------------------------------------------
ec_climate_search_locations(5590)

## ------------------------------------------------------------------------
ec_climate_geosearch_locations("gatineau QC", limit = 5)

## ------------------------------------------------------------------------
ec_climate_search_locations(c(-75.72327, 45.45724), limit = 5)

## ------------------------------------------------------------------------
ec_climate_geosearch_locations(
  "gatineau QC",
  year = 2014:2016,
  timeframe = "daily",
  limit = 5
)

## ------------------------------------------------------------------------
ec_climate_geosearch_locations(
  "gatineau QC",
  year = 2014:2016,
  timeframe = "daily",
  limit = 5
) %>%
  tibble::as_tibble()

## ------------------------------------------------------------------------
# find the station ID (CHELSEA QC 5585)
ec_climate_search_locations("chelsea", timeframe = "daily", year = 2015)

# load the data
ec_climate_data(
  "CHELSEA QC 5585", timeframe = "daily", 
  start = "2015-01-01", end = "2015-12-31"
)

## ----climate-long, warning=FALSE, message=FALSE, results='hide'----------
library(ggplot2)
df <- ec_climate_data(
  "CHELSEA QC 5585", timeframe = "daily", 
  start = "2015-01-01", end = "2015-12-31"
) %>%
  ec_climate_long()
  
ggplot(df, aes(date, value)) + 
  geom_line() + 
  facet_wrap(~param, scales="free_y") +
  scale_x_date(date_labels = "%b")

## ----climate-compare, warning=FALSE, results='hide'----------------------
df <- ec_climate_data(
  c("CHELSEA QC 5585", "KENTVILLE CDA CS NS 27141"), 
  timeframe = "daily", 
  start = "2015-11-01", "2015-11-30"
) %>%
  ec_climate_long()

ggplot(df, aes(date, value, col = location)) + 
  geom_line() + 
  facet_wrap(~param, scales="free_y") +
  scale_x_date(date_labels = "%d")

## ---- message=FALSE, warning=FALSE---------------------------------------
library(dplyr)

ec_climate_data(
  "KENTVILLE CDA CS NS 27141", timeframe = "hourly", 
  start = "1999-07-01", end = "1999-07-31"
) %>%
  select(date, time_lst, date_time_utc, date_time_local)

## ------------------------------------------------------------------------
df <- ec_climate_data(
  "KENTVILLE CDA CS NS 27141", timeframe = "daily",
  start = "2015-11-01", end = "2015-11-30"
)

## ------------------------------------------------------------------------
problems(df)

## ------------------------------------------------------------------------
ec_climate_data(
  "KENTVILLE CDA CS NS 27141", timeframe = "daily",
  start = "2015-11-01", end = "2015-11-30",
  value_parser = readr::parse_character
) %>%
  select(date, spd_of_max_gust_km_h, spd_of_max_gust_flag)

## ------------------------------------------------------------------------
df <- ec_climate_data(
  "CHELSEA QC 5585", timeframe="daily", 
  start = "2015-01-01", end = "2015-12-31"
)

attr(df, "flag_info")

## ----climate-md, warning = FALSE, results='hide'-------------------------
library(mudata2)
md <- ec_climate_mudata(
  "CHELSEA QC 5585", timeframe = "daily", 
  start = "2015-01-01", end = "2015-12-31"
)

autoplot(md) +
  scale_x_date(date_labels = "%b")

