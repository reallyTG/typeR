## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(busdater)

## ------------------------------------------------------------------------
Sys.Date()
getOption("busdaterFYstart", default = "07-01")

## ------------------------------------------------------------------------
get_fy()

## ------------------------------------------------------------------------
dt <- as.Date(c("01-01-2018", "15-12-2017"), "%d-%m-%Y")
get_fy(date = dt[1])
get_fy(date = dt)

## ------------------------------------------------------------------------
get_fy(offset_period = 1) # current financial year + 1
get_fy(date = dt[1], offset_period = 1)
get_fy(date = dt, offset_period = 1)

## ------------------------------------------------------------------------
get_fy(offset_period=-1) ## return the previous financial year as integer
get_fy(date = dt[1], offset_period = -1)
get_fy(date = dt, offset_period = -1)

## ------------------------------------------------------------------------
Sys.Date()
getOption("busdaterFYstart", default = "07-01")

## ------------------------------------------------------------------------
get_boundary()
get_boundary(opt_fy_start = "07-01")
get_boundary(opt_fy_start = "01-03")

## ------------------------------------------------------------------------
get_boundary(boundary = "last day")



## ------------------------------------------------------------------------
get_boundary(offset_period = -1, bus_period = "CY", boundary = "last day")

## ------------------------------------------------------------------------
get_boundary(offset_period = 14, offset_type = "month",
                  bus_period = "M", boundary = "last day")

## ------------------------------------------------------------------------
get_boundary(as.Date(c("02/27/1992", "09/28/2022"), "%m/%d/%Y"),
                  offset_period = -3, offset_type = "month",
                  bus_period = "FY", boundary = "1st day")

