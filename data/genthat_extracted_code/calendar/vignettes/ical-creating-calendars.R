## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(calendar)

## ------------------------------------------------------------------------
# key:value pairs in an ical example:
ic_list(ical_example)[[1]]

## ------------------------------------------------------------------------
library(calendar)
s = as.POSIXct("2019-01-12")
e = s + 60^2 * 24 *5
event = ic_event(start = s, end = e , summary = "Research trip")
event
class(event)
ic_character(event)

