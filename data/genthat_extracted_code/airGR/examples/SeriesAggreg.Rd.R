library(airGR)


### Name: SeriesAggreg
### Title: Conversion of time series to another time step (aggregation
###   only)
### Aliases: SeriesAggreg

### ** Examples

library(airGR)

## loading catchment data
data(L0123002)

## preparation of the initial time series data frame at the daily time step
TabSeries  <- data.frame(BasinObs$DatesR, BasinObs$P, BasinObs$E, BasinObs$T, BasinObs$Qmm)
TimeFormat <- "daily"

## conversion at the monthly time step
NewTimeFormat <- "monthly"
ConvertFun    <- c("sum", "sum", "mean", "sum")
NewTabSeries  <- SeriesAggreg(TabSeries = TabSeries, TimeFormat, NewTimeFormat, ConvertFun)

## conversion at the yearly time step
NewTimeFormat <- "yearly"
ConvertFun <- c("sum", "sum", "mean", "sum")
NewTabSeries <- SeriesAggreg(TabSeries = TabSeries, TimeFormat, NewTimeFormat, ConvertFun)




