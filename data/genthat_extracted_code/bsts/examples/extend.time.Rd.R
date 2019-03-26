library(bsts)


### Name: extend.time
### Title: Extends a vector of dates to a given length
### Aliases: ExtendTime
### Keywords: chron

### ** Examples

  origin.month <- as.Date("2011-09-01")
  week.ending <- as.Date(c("2011-10-01",   ## 1
                           "2011-10-08",   ## 2
                           "2011-12-03",   ## 3
                           "2011-12-31"))  ## 4
  MatchWeekToMonth(week.ending, origin.month) == 1:4



