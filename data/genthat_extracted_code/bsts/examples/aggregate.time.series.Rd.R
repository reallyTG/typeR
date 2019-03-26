library(bsts)


### Name: aggregate.time.series
### Title: Aggregate a fine time series to a coarse summary
### Aliases: AggregateTimeSeries
### Keywords: chron

### ** Examples

  week.ending <- as.Date(c("2011-11-05",
                           "2011-11-12",
                           "2011-11-19",
                           "2011-11-26",
                           "2011-12-03",
                           "2011-12-10",
                           "2011-12-17",
                           "2011-12-24",
                           "2011-12-31"))
  membership.fraction <- GetFractionOfDaysInInitialMonth(week.ending)
  which.month <- MatchWeekToMonth(week.ending, as.Date("2011-11-01"))
  contains.end <- WeekEndsMonth(week.ending)

  weekly.values <- rnorm(length(week.ending))
  monthly.values <- AggregateTimeSeries(weekly.values, contains.end, membership.fraction)




