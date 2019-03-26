library(bsts)


### Name: last.day.in.month
### Title: Find the last day in a month
### Aliases: LastDayInMonth
### Keywords: chron

### ** Examples

 inputs <- as.Date(c("2007-01-01",
                     "2007-01-31",
                     "2008-02-01",
                     "2008-02-29",
                     "2008-03-14",
                     "2008-12-01",
                     "2008-12-31"))
 expected.outputs <- as.Date(c("2007-01-31",
                              "2007-01-31",
                              "2008-02-29",
                              "2008-02-29",
                              "2008-03-31",
                              "2008-12-31",
                              "2008-12-31"))
 LastDayInMonth(inputs) == expected.outputs



