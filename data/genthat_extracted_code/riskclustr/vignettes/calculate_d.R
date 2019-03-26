## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(riskclustr)

d(
  label = "subtype",
  M = 4, 
  factors = list("x1", "x2", "x3"),
  data = subtype_data
)

## ------------------------------------------------------------------------
subtype_cases <- subtype_data[subtype_data$subtype != 0, ]

## ------------------------------------------------------------------------
dstar(
  label = "subtype",
  M = 4, 
  factors = list("x1", "x2", "x3"),
  data = subtype_cases
)

