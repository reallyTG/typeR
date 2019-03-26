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

## ----fredr_category1-----------------------------------------------------
fredr_category() 

## ----fredr_category2-----------------------------------------------------
fredr_category(category_id = 97L)

## ----fredr_category_children1--------------------------------------------
fredr_category_children()

## ----fredr_category_children2--------------------------------------------
fredr_category_children(category_id = 1L)

## ----fredr_category_related1---------------------------------------------
fredr_category_related()

## ----fredr_category_related2---------------------------------------------
fredr_category_related(category_id = 4L) # Employment Cost Index

## ----fredr_category_series1----------------------------------------------
fredr_category_series(
  category_id = 97L, # Housing
  limit = 100L,
  order_by = "last_updated",
  filter_variable = "frequency",
  filter_value = "Quarterly"
)

## ----fredr_category_series2----------------------------------------------
fredr_category_series(
  category_id = 32992L, # National Accounts
  order_by = "frequency",
  sort_order = "desc",
  tag_names = "usa",
  exclude_tag_names = "gnp"
)

## ----fredr_category_tags1------------------------------------------------
fredr_category_tags(
  category_id = 6L,
  tag_group_id = "src"
)

## ----fredr_category_tags2------------------------------------------------
fredr_category_tags(
  category_id = 1L,
  search_text = "usa",
  order_by = "popularity",
  sort_order = "desc"
)

## ----fredr_category_related_tags1----------------------------------------
fredr_category_related_tags(
  category_id = 1L,
  tag_names = "business;monthly",
  exclude_tag_names = "rate",
  order_by = "name"
)

