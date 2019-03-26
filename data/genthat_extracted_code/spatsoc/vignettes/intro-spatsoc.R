## ----knitropts, include = FALSE------------------------------------------
knitr::opts_chunk$set(message = TRUE, 
                      warning = FALSE,
                      eval = FALSE, 
                      echo = FALSE)

## ----libs, eval = TRUE, include = FALSE----------------------------------
library(spatsoc); library(data.table)
DT <- fread(system.file("extdata", "DT.csv", package = "spatsoc"))[ID %in% c('H', 'I', 'J')]
DT[, datetime := as.POSIXct(datetime, tz = 'UTC')]

## ---- echo = TRUE--------------------------------------------------------
#  ## Load packages
#  library(spatsoc)
#  library(data.table)
#  
#  ## Read in spatsoc's example data
#  DT <- fread(system.file("extdata", "DT.csv", package = "spatsoc"))
#  
#  ## Subset to only individuals H, I, and J
#  DT <- DT[ID %in% c('H', 'I', 'J')]
#  
#  ## Cast character column 'datetime' as POSIXct
#  DT[, datetime := as.POSIXct(datetime,
#                              tz = 'UTC')]

## ---- eval = TRUE--------------------------------------------------------
knitr::kable(DT[, .SD[1:2], ID][order(datetime)])

## ----groupmins, echo = TRUE----------------------------------------------
#  group_times(DT, datetime = 'datetime', threshold = '5 minutes')

## ----tableSetUp, eval = TRUE---------------------------------------------
nRows <- 9

## ----tabgroupmins, eval = TRUE-------------------------------------------
knitr::kable(
  group_times(DT, threshold = '5 minutes', datetime = 'datetime')[, 
    .(ID, X, Y, datetime, minutes, timegroup)][
      order(datetime)][
        1:nRows])

## ----grouphours, echo = TRUE---------------------------------------------
#  group_times(DT, datetime = 'datetime', threshold = '2 hours')

## ----tabgrouphours, eval = TRUE------------------------------------------
knitr::kable(
  group_times(DT, threshold = '2 hours', datetime = 'datetime')[, 
    .(ID, X, Y, datetime, hours, timegroup)][
      order(datetime)][
        1:nRows])

## ----groupdays, echo = TRUE----------------------------------------------
#  group_times(DT, datetime = 'datetime', threshold = '5 days')

## ----tabgroupdays, eval = TRUE-------------------------------------------
knitr::kable(
  group_times(DT, threshold = '5 days', datetime = 'datetime')[, .SD[sample(.N, 3)], by = .(timegroup, block)][order(datetime)][
        1:nRows, .(ID, X, Y, datetime, block, timegroup)])

## ----grouppts, echo = TRUE-----------------------------------------------
#  group_times(DT = DT, datetime = 'datetime', threshold = '15 minutes')
#  group_pts(DT, threshold = 50, id = 'ID', coords = c('X', 'Y'), timegroup = 'timegroup')

## ----fakegrouppts, eval = TRUE-------------------------------------------
DT <- group_times(DT = DT, datetime = 'datetime', 
                     threshold = '15 minutes')
DT <- group_pts(
    DT = DT,
    threshold = 50, id = 'ID', coords = c('X', 'Y'),
    timegroup = 'timegroup')

knitr::kable(
  DT[
      between(group,  771, 774)][order(timegroup)][
        1:nRows, .(ID, X, Y, timegroup, group)]
)

## ----fakegrouplines, echo = TRUE-----------------------------------------
#  utm <- '+proj=utm +zone=21 ellps=WGS84'
#  group_times(DT = DT, datetime = 'datetime', threshold = '1 day')
#  group_lines(DT, threshold = 50, projection = utm,
#              id = 'ID', coords = c('X', 'Y'),
#              timegroup = 'timegroup', sortBy = 'datetime')

## ----grouplines, eval = TRUE---------------------------------------------
utm <- '+proj=utm +zone=21 ellps=WGS84'

DT <- group_times(DT = DT, datetime = 'datetime', 
                threshold = '1 day')
DT <- group_lines(DT,
                  threshold = 50, projection = utm, 
                  id = 'ID', coords = c('X', 'Y'), 
                  sortBy = 'datetime', timegroup = 'timegroup')
knitr::kable(
  unique(DT[, .(ID, timegroup, group)])[, .SD[1:3], ID][order(timegroup)]
)

## ----fakegrouppolys, echo = TRUE-----------------------------------------
#  utm <- '+proj=utm +zone=21 ellps=WGS84'
#  group_times(DT = DT, datetime = 'datetime', threshold = '8 days')
#  group_polys(DT = DT, area = TRUE, hrType = 'mcp',
#             hrParams = list('percent' = 95),
#             projection = utm,
#             coords = c('X', 'Y'), id = 'ID')

## ----grouppolys, eval = TRUE---------------------------------------------
utm <- '+proj=utm +zone=21 ellps=WGS84'
DT <- group_times(DT = DT, datetime = 'datetime', 
                threshold = '8 days')
knitr::kable(
  data.frame(group_polys(
    DT, 
    area = TRUE, hrType = 'mcp',
           hrParams = list('percent' = 95),
           projection = utm,
           coords = c('X', 'Y'), id = 'ID')[
             , .(ID1, ID2, area, proportion)])
)

