library(bsts)


### Name: week.ends
### Title: Check to see if a week contains the end of a month or quarter
### Aliases: WeekEndsMonth WeekEndsQuarter
### Keywords: chron

### ** Examples

  week.ending <- as.Date(c("2011-10-01",
                           "2011-10-08",
                           "2011-12-03",
                           "2011-12-31"))
  WeekEndsMonth(week.ending) == c(TRUE, FALSE, TRUE, TRUE)
  WeekEndsQuarter(week.ending) == c(TRUE, FALSE, FALSE, TRUE)



