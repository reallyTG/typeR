## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----loadmapzen, echo = FALSE--------------------------------------------
library(rmapzen)
oakland_public

## ------------------------------------------------------------------------
mz_bbox(oakland_public)
as.data.frame(oakland_public)

## ------------------------------------------------------------------------
ca_tiles

## ------------------------------------------------------------------------
# points of interest
as_sf(ca_tiles$pois)

## ----ex-tidy, warning = FALSE, message = FALSE---------------------------
library(dplyr)
library(sf)
as_sf(oakland_public) %>%
    select(name, confidence, region, locality, neighbourhood)

## ----ex-accessors--------------------------------------------------------
mz_bbox(ca_tiles)

