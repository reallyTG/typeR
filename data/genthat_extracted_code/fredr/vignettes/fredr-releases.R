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

## ----fredr_releases1-----------------------------------------------------
fredr_releases()

## ----fredr_releases_dates1-----------------------------------------------
fredr_releases_dates()

## ----fredr_releases_dates2-----------------------------------------------
fredr_releases_dates(
  sort_order = "asc",
  order_by = "release_id"
)

## ----fredr_release1------------------------------------------------------
fredr_release(release_id = 11L)

## ----fredr_release_dates1------------------------------------------------
fredr_release_dates(release_id = 11L)

## ----fredr_release_series1-----------------------------------------------
fredr_release_series(release_id = 10L)

## ----fredr_release_series2-----------------------------------------------
fredr_release_series(
  release_id = 10L,
  filter_variable = "frequency",
  filter_value = "Monthly",
  order_by = "popularity",
  sort_order = "desc",
  limit = 10L
)

## ----fredr_release_tags1-------------------------------------------------
fredr_release_tags(
  release_id = 10L,
  tag_group_id = "geo",
  order_by = "popularity",
  sort_order = "desc"
)

## ----fredr_release_related_tags1-----------------------------------------
fredr_release_related_tags(
  release_id = 10L,
  tag_names = "bls",
  tag_group_id = "freq",
  exclude_tag_names = "annual",
  order_by = "popularity",
  sort_order = "desc"
)

## ----fredr_release_sources1----------------------------------------------
fredr_release_sources(release_id = 10L)

## ----fredr_release_table1------------------------------------------------
cpi_tbl <- fredr_release_tables(release_id = 10L)
cpi_tbl

## ----fredr_release_table2------------------------------------------------
library(dplyr)
library(tibble)

cpi_tbl %>%
  slice(2) %>%
  deframe()

## ----fredr_release_table3------------------------------------------------
fredr_release_tables(
  release_id = 10L,
  element_id = 36712L
)

