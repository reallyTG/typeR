library(xts)


### Name: to.period
### Title: Convert time series data to an OHLC series
### Aliases: to.period to_period to.minutes to.minutes3 to.minutes5
###   to.minutes10 to.minutes15 to.minutes30 to.hourly to.daily to.weekly
###   to.monthly to.quarterly to.yearly OHLC
### Keywords: utilities

### ** Examples

data(sample_matrix)

samplexts <- as.xts(sample_matrix)

to.monthly(samplexts)
to.monthly(sample_matrix)

str(to.monthly(samplexts))
str(to.monthly(sample_matrix))



