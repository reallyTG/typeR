library(hydroTSM)


### Name: subdaily2daily
### Title: Sub-daily -> Daily
### Aliases: subdaily2daily subdaily2daily.default subdaily2daily.zoo
###   subdaily2daily.data.frame subdaily2daily.matrix
### Keywords: manip

### ** Examples

## Loading the time series of hourly streamflows for the station Karamea at Gorge
data(KarameaAtGorgeQts)
x <- KarameaAtGorgeQts

# Plotting the hourly streamflow values
plot(x)

## sub-daily to Daily
d <- subdaily2daily(x, FUN=sum, na.rm=TRUE)

# Plotting the daily streamflow values
plot(d)



