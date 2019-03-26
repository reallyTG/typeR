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

## ----fredr_sources1------------------------------------------------------
fredr_sources()

## ----fredr_source1-------------------------------------------------------
fredr_source(source_id = 6L)

## ----fredr_source_releases1----------------------------------------------
fredr_source_releases(
  source_id = 1L,
  limit = 10L
)

## ----fredr_source_releases2----------------------------------------------
fredr_source_releases(
  source_id = 14L,
  realtime_start = as.Date("1950-01-01")
)

