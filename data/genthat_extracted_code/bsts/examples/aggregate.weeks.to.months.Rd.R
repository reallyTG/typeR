library(bsts)


### Name: aggregate.weeks.to.months
### Title: Aggregate a weekly time series to monthly
### Aliases: AggregateWeeksToMonths
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

  weekly.values <- zoo(rnorm(length(week.ending)), week.ending)
  monthly.values <- AggregateWeeksToMonths(weekly.values)



