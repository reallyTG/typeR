## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(
  comment = "#>",
  error = FALSE,
  tidy = FALSE)

## ----is_good-------------------------------------------------------------
library("lubridate")
library("fmdates")
ausy <- AUSYCalendar()
aume <- AUMECalendar()
syme <- c(ausy, aume) # handy JointCalendar construction approach
is_good(ymd(20140404), ausy)
is_good(ymd(20141104), syme) # Melbourne Cup holiday
syme$rule <- any
is_good(ymd(20141104), syme)

## ----adjust_dates--------------------------------------------------------
adjust(ymd(20140404), 'mf', ausy)
adjust(ymd(20141130), 'mf', ausy)
adjust(ymd(20141101), 'mp', ausy)
adjust(ymd(20141115), 'ms', ausy)

## ----shift_dates---------------------------------------------------------
shift(ymd(20120229), days(2), 'u', ausy, FALSE) # two good days
shift(ymd(20120229), months(1), 'u', ausy, FALSE) # one month
shift(ymd(20120229), months(1), 'mf', ausy, TRUE)  # one month with EOM rule
shift(ymd(20120229), years(1) + months(3), 'mf', ausy, TRUE)  # 1y3m
shift(ymd(20120229), hours(1), 'mf', ausy, TRUE)  # periods < days ignored.

## ----schedules-----------------------------------------------------------
# No stub
generate_schedule(effective_date = ymd(20120103), termination_date = ymd(20130103), 
  tenor = months(3), calendar = AUSYCalendar(), bdc = "mf", stub = "short_front", 
  eom_rule = FALSE)
# Front stub
generate_schedule(effective_date = ymd(20120103), termination_date = ymd(20121203), 
  tenor = months(3), calendar = AUSYCalendar(), bdc = "mf", stub = "short_front", 
  eom_rule = FALSE)

## ----day_counters--------------------------------------------------------
year_frac(ymd("2010-03-31"), ymd("2012-03-31"), "30/360us")
year_frac(ymd("2010-02-28"), ymd("2012-03-31"), "act/365")

