## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup---------------------------------------------------------------
library(lgr)

## ------------------------------------------------------------------------
FATAL("This is an important message about %s going wrong", "something")
ERROR("A less severe error")
WARN("something likely went wrong")
INFO("Everything is ok")
DEBUG("Debug messages are hidden by default")
console_threshold("debug")  # you must use lower case names here
DEBUG("unless we lower the threshold")
TRACE("Trace is even lower than debug")

## ------------------------------------------------------------------------
show_log(3)  # show the last 3 log entries

