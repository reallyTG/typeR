## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  fig.width = 3.4,
  fig.height = 2.4,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(dint)

## ------------------------------------------------------------------------
date_yq(2015, 1)
date_ym(c(2015, 2016), c(1, 2))
date_yw(c(2008, 2009), 1)

## ------------------------------------------------------------------------
as_date_yq(Sys.Date())
as_date_yq(20141)   # the last digit is interpreted as quarter
as_date_ym(201412)  # the last two digits are interpreted as month
as_date_yw("2018-01-01")  # anything else that can be parsed by as.Date() works

## ------------------------------------------------------------------------
d <- as.Date("2018-05-12")
as_date_yq(d)
as_date_ym(d)
as_date_yw(d)
as_date_y(d)

## ------------------------------------------------------------------------
q <- date_yq(2015, 1)
as.Date(q)
as.POSIXlt(q)

## ------------------------------------------------------------------------
as.POSIXct(q)
as.POSIXct(q, tz = "GMT")
print(as.POSIXct(q), tz = "GMT")
print(as.POSIXct(q), tz = "CET")


## ------------------------------------------------------------------------
q <- date_yq(2014, 4)
q + 1
q - 1
seq(q - 2, q + 2)

m <- date_ym(2014, 12)
m + 1
m - 1
seq(m - 2, m + 2)

w <- date_yw(2017, 33)
w + 1
w - 1
seq(w - 2, w + 2)


## ------------------------------------------------------------------------
q <- date_yq(2014, 4)
get_year(q)
get_quarter(q)
get_month(q) # defaults to first month of quarter
get_isoweek(q)

m <- date_ym(2014, 12)
get_year(m)
get_quarter(m)
get_month(m)
get_isoweek(m)

w <- date_yw(2014, 33)
get_year(w)
get_quarter(w)
get_month(w)
get_isoweek(w)

## ------------------------------------------------------------------------
suppressPackageStartupMessages(library(lubridate))

year(q)
quarter(q)
month(q)

## ------------------------------------------------------------------------
q <- date_yq(2015, 1)
first_of_quarter(q)  # the same as as.Date(q), but more explicit
last_of_quarter(q)  # the same as as.Date(q), but more explicit

## ------------------------------------------------------------------------
d <- as.Date("2018-05-12")
first_of_year(d)
last_of_year(d)
first_of_quarter(d)
last_of_quarter(d)
first_of_month(d)
last_of_month(d)
first_of_isoweek(d)
last_of_isoweek(d)

# Alternativeley you can use these:
first_of_yq(2012, 2)
last_of_ym(2012, 2)
last_of_yw(2011, 52)

## ------------------------------------------------------------------------
q <- date_yq(2014, 4)
format(q, "%Y-Q%q")  # iso/default
format(q, "%Y.%q")
format(q, "%y.%q")

m <- date_ym(2014, 12)
format(m, "%Y-M%m")  # iso/default

w <- date_yw(2014, 1)
format(w, "%Y-W%W")  # iso/default

## ------------------------------------------------------------------------
format_yq(Sys.Date())
format_yq_short(Sys.Date())
format_yq_shorter(Sys.Date())

format_ym(Sys.Date())
format_yw(Sys.Date())

## ------------------------------------------------------------------------
library(ggplot2)

## ---- collapse=TRUE, fig.show='hold'-------------------------------------
q <- data.frame(
  time  = seq(date_yq(2016, 1), date_yq(2016, 4)),
  value = rnorm(4)
)

m <- data.frame(
  time  = seq(date_ym(2016, 8), date_ym(2016, 11)),
  value = rnorm(4)
)

w <- data.frame(
  time  = seq(date_yw(2016, 48), date_yw(2017, 1)),
  value = abs(rnorm(6))
)

w2 <- data.frame(
  time  = seq(date_yw(2016, 1), date_yw(2019, 1)),
  value = abs(rnorm(157))
)

ggplot(q, aes(x = time, y = value))  + 
  geom_point()

ggplot(m, aes(x = time, y = value))  + 
  geom_line() +
  scale_x_date_ym(labels = format_ym_shorter)

ggplot(w, aes(x = time, y = value))  + 
  geom_col()  + 
  scale_x_date_yw(labels = format_yw_iso)

ggplot(w2, aes(x = time, y = value)) + 
  geom_smooth() 

## ---- collapse=TRUE, fig.show='hold'-------------------------------------
x <- data.frame(
  time  = seq(as.Date("2016-01-01"), as.Date("2016-08-08"), by = "day"),
  value = rnorm(221)
)

p <- ggplot(
  x,
  aes(
    x = time, 
    y = value)
  ) + geom_point()

p + ggtitle("iso") + ggtitle("default")
p + scale_x_date(labels = format_yq_iso) + ggtitle("date_yq_iso")
p + scale_x_date(labels = format_ym_short) + ggtitle("date_ym_short")
p + scale_x_date(labels = format_yw_shorter) + ggtitle("date_yw_shorter")

