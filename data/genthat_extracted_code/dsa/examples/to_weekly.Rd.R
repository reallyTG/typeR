library(dsa)


### Name: to_weekly
### Title: Change a daily to a weekly differenced time series
### Aliases: to_weekly

### ** Examples

to_weekly(xts::xts(rnorm(365, 10,1), seq.Date(as.Date("2010-01-01"), length.out=365, by="days")))



