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

## ----fredr_tags1, message=FALSE, warning=FALSE---------------------------
fredr_tags()

## ----fredr_tags2, message=FALSE, warning=FALSE---------------------------
fredr_tags(tag_names = "gdp;oecd")

## ----fredr_tags3, message=FALSE, warning=FALSE---------------------------
fredr_tags(
  tag_group_id = "geo",
  limit = 50L
)

## ----fredr_tags4, message=FALSE, warning=FALSE---------------------------
fredr_tags(search_text = "unemployment")

## ----fredr_tags5, message=FALSE, warning=FALSE---------------------------
fredr_series_search_tags(
  series_search_text = "unemployment",
  limit = 100L
)

## ----fredr_related_tags1-------------------------------------------------
fredr_related_tags(tag_names = "monetary aggregates;weekly")

## ----fredr_related_tags2-------------------------------------------------
fredr_related_tags(
  tag_names = "monetary aggregates;weekly",
  tag_group_id = "gen"
)

## ----fredr_related_tags3-------------------------------------------------
fredr_related_tags(
  tag_names = "monetary aggregates;weekly",
  tag_group_id = "gen",
  search_text = "money stock"
)

## ----fredr_series_tags1--------------------------------------------------
fredr_tags_series(tag_names = "gdp")

## ----fredr_series_tags2--------------------------------------------------
fredr_tags_series(
  tag_names = "gdp",
  exclude_tag_names = "quarterly",
  order_by = "popularity",
  limit = 100L
)

