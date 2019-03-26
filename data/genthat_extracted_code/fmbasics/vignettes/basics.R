## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(
  comment = "#>",
  error = FALSE,
  tidy = FALSE)

## ----currency------------------------------------------------------------
library("fmbasics")
(aud <- AUD())
aud$iso
aud$calendar

## ----currency_pairs------------------------------------------------------
(audusd <- AUDUSD())
dates <- as.Date(c("2014-04-16", "2014-04-19"))
to_fx_value(dates, 'today', audusd)
to_fx_value(dates, 'spot', audusd)
to_fx_value(dates, 'spot_next', audusd)
to_fx_value(dates, 'tomorrow', audusd)
to_fx_value(dates, months(3), audusd)

## ----make_currency_pair--------------------------------------------------
library("fmdates")
CurrencyPair(USD(), AUD(), c(USNYCalendar(), AUSYCalendar()))

## ----indices, message=FALSE----------------------------------------------
library("lubridate")
AONIA()
FedFunds()
AUDBBSW(months(3))
USDLIBOR(months(3))

## ----index_dates---------------------------------------------------------
to_reset(ymd(20170105) + days(0:2), USDLIBOR(months(3)))
to_value(ymd(20170105) + days(0:2), USDLIBOR(months(3)))
to_maturity(ymd(20170105) + days(0:2), USDLIBOR(months(3)))

