library(bsts)


### Name: descriptive-plots
### Title: Descriptive Plots
### Aliases: YearPlot MonthPlot DayPlot

### ** Examples

## Plot a 'ts' time series.
data(AirPassengers)
par(mfrow = c(1,2))
MonthPlot(AirPassengers)
YearPlot(AirPassengers)

## Plot a 'zoo' time series.
data(turkish)
par(mfrow = c(1,2))
YearPlot(turkish)
DayPlot(turkish)




