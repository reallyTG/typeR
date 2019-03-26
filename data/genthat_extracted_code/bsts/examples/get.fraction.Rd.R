library(bsts)


### Name: get.fraction
### Title: Compute membership fractions
### Aliases: GetFractionOfDaysInInitialMonth
###   GetFractionOfDaysInInitialQuarter
### Keywords: chron

### ** Examples

    dates <- as.Date(c("2003-03-31",
                       "2003-04-01",
                       "2003-04-02",
                       "2003-04-03",
                       "2003-04-04",
                       "2003-04-05",
                       "2003-04-06",
                       "2003-04-07"))
    fraction <- GetFractionOfDaysInInitialMonth(dates)
    fraction == c(1, 6/7, 5/7, 4/7, 3/7, 2/7, 1/7, 1)



