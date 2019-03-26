## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----message=FALSE, warning=FALSE----------------------------------------
library(bizdays)

create.calendar(name = "example1", weekdays = c("saturday", "sunday"), start.date = "2017-01-24", end.date = "2017-01-30", holidays = "2017-01-25", financial = FALSE)

calendars()[["example1"]] # view the calendar

## ------------------------------------------------------------------------
bizdays("2017-01-24", "2017-01-26", "example1")

## ------------------------------------------------------------------------
bizdays("2017-01-24", "2017-01-25", "example1")
bizdays("2017-01-25", "2017-01-26", "example1")

## ------------------------------------------------------------------------
offset("2017-01-25", c(-1, 1), "example1")

## ------------------------------------------------------------------------
bizdays("2017-01-25", "2017-01-28", "example1")
bizdays("2017-01-25", "2017-01-29", "example1")

## ----message=FALSE, warning=FALSE----------------------------------------
create.calendar(name = "example2", weekdays = c("saturday", "sunday"), start.date = "2017-01-24", end.date = "2017-01-30", holidays = "2017-01-25", financial = TRUE)

calendars()[["example2"]] # view the calendar

## ------------------------------------------------------------------------
bizdays("2017-01-25", "2017-01-26", "example2")

## ------------------------------------------------------------------------
offset("2017-01-25", 1, "example2")

## ------------------------------------------------------------------------
prev_date = preceding("2017-01-25", "example2")
prev_date
bizdays(prev_date, "2017-01-26", "example2")
offset(prev_date, 1, "example2")

## ----message=FALSE, warning=FALSE----------------------------------------
create.calendar(name = "example3", weekdays = c("saturday", "sunday"), start.date = "2017-01-24", end.date = "2017-01-30", holidays = "2017-01-25", financial = TRUE, adjust.from = preceding, adjust.to = following)

calendars()[["example3"]] # view the calendar

## ------------------------------------------------------------------------
bizdays("2017-01-25", "2017-01-26", "example3")
offset("2017-01-25", 1, "example3")

