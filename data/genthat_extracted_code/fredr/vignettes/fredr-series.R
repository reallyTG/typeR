## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  fig.width = 7,
  fig.height = 5,
  eval = !(Sys.getenv("FRED_API_KEY") == ""),
  cache = TRUE,
  collapse = TRUE,
  comment = "#>"
)
library(fredr)
options(digits = 4)

## ----fredr_series_observations, message=FALSE, warning=FALSE-------------
fredr(
  series_id = "UNRATE",
  observation_start = as.Date("1990-01-01")
)

## ----fredr_series_search_text1-------------------------------------------
fredr_series_search_text(
  search_text = "unemployment",
  limit = 100L
)

## ----fredr_search_id1----------------------------------------------------
fredr_series_search_id(
  search_text = "UNRATE",
  limit = 100L
)

## ----fredr_series_search_tags, message=FALSE, warning=FALSE--------------
fredr_series_search_tags(
  series_search_text = "unemployment",
  limit = 100L
)

## ----fredr_search_related_tags1------------------------------------------
fredr_series_search_related_tags(
  series_search_text = "gnp",
  tag_names = "usa",
  limit = 30L
)

## ----fredr_series1-------------------------------------------------------
fredr_series(series_id = "UNRATE")

## ----fredr_series2-------------------------------------------------------
fredr_series(
  series_id = "UNRATE",
  realtime_start = as.Date("1950-01-01")
)

## ----fredr_series_categories1--------------------------------------------
fredr_series_categories(series_id = "UNRATE")

## ----fredr_series_release1-----------------------------------------------
fredr_series_release(series_id = "UNRATE")

## ----fredr_series_tags1--------------------------------------------------
fredr_series_tags(
  series_id = "UNRATE",
  order_by = "name"
)

## ----fredr_series_updates1-----------------------------------------------
fredr_series_updates()

## ----fredr_series_updates2-----------------------------------------------
fredr_series_updates(
  start_time = Sys.time() - 60 * 60,
  end_time = Sys.time(),
  filter_value = "macro"
)

## ----fredr_series_vintagedates1------------------------------------------
fredr_series_vintagedates(series_id = "UNRATE")

