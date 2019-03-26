library(timeSeries)


### Name: durations
### Title: Durations from a Time Series
### Aliases: durations durationSeries
### Keywords: chron

### ** Examples

## Compute Durations in days for the MSFT Sereries - 
   head(durations(MSFT, units = "days"))
   head(durations(MSFT, trim = TRUE, units = "days"))

## The same in hours - 
   head(durations(MSFT, trim = TRUE, units = "hours"))



