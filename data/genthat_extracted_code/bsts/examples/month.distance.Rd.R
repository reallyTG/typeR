library(bsts)


### Name: month.distance
### Title: Elapsed time in months
### Aliases: MonthDistance
### Keywords: chron

### ** Examples

  dates <- as.Date(c("2008-04-17",
                     "2008-05-01",
                     "2008-05-31",
                     "2008-06-01"))
  origin <- as.Date("2008-05-15")
  MonthDistance(dates, origin) ==  c(-1, 0, 0, 1)



