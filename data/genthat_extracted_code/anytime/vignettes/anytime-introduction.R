## ----initialsetup, include=FALSE-----------------------------------------
knitr::opts_chunk$set(cache=FALSE)

## ---- setup-------------------------------------
library(anytime)                 # our library
options(width=50,                # column width
        digits.secs=6)           # fractional secs
Sys.setenv(TZ=anytime:::getTZ()) # TZ helper

## ---- int_num_date------------------------------
## integer
anydate(20160101L + 0:2)

## numeric
anydate(20160101 + 0:2)

## ---- int_num_dt--------------------------------
## integer
anytime(1451628000L + 0:2)

## numeric
anytime(1451628000 + 0:2)

## ---- int_num_alt-------------------------------
## integer
anytime(20160101L + 0:2, oldHeuristic=TRUE)

## numeric
anytime(20160101 + 0:2, oldHeuristic=TRUE)

## ---- fac_ord-----------------------------------
## factor
anytime(as.factor(20160101 + 0:2))

## ordered
anytime(as.ordered(20160101 + 0:2))

## ---- char_dates--------------------------------
## Dates: Character
anytime(as.character(20160101 + 0:2))

## Dates: alternate formats
anytime(c("20160101", "2016/01/02", "2016-01-03"))

## ---- char_iso----------------------------------
## Datetime: ISO with/without fractional seconds
anytime(c("2016-01-01 10:11:12",
          "2016-01-01 10:11:12.345678"))

## ---- char_date_text----------------------------
## ISO style
anytime(c("2016-Sep-01 10:11:12",
          "Sep/01/2016 10:11:12",
          "Sep-01-2016 10:11:12"))

## Datetime: Mixed format
## (cf http://stackoverflow.com/questions/39259184)
anytime(c("Thu Sep 01 10:11:12 2016",
          "Thu Sep 01 10:11:12.345678 2016"))

## ---- date_iso----------------------------------
## Datetime: pre/post DST
anytime(c("2016-01-31 12:13:14",
          "2016-08-31 12:13:14"))
## important: catches change
anytime(c("2016-01-31 12:13:14",
          "2016-08-31 12:13:14"), tz="UTC")

## ---- date_single_digit-------------------------
anytime(c("2016-1-31", "2016-2-1"))
anytime(c("2016-1-31", "2016-2-1"), useR=TRUE)

## -----------------------------------------------
getFormats()

## ----output_ex----------------------------------
pt <- anytime("2016-01-31 12:13:14.123456")
iso8601(pt)
rfc2822(pt)
rfc3339(pt)
yyyymmdd(pt)

