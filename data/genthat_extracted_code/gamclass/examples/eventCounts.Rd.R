library(gamclass)


### Name: eventCounts
### Title: Tabulate vector of dates by specified time event
### Aliases: eventCounts
### Keywords: manip chron

### ** Examples

crashDate <- as.Date(c("1908-09-17","1912-07-12","1913-08-06",
                       "1913-09-09","1913-10-17"))
df <- data.frame(date=crashDate)
byYears <- eventCounts(data=df, dateCol="date",
                       from=as.Date("1908-01-01"),
                       by="1 year")



