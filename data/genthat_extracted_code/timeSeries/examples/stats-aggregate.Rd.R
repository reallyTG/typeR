library(timeSeries)


### Name: aggregate-methods
### Title: timeSeries Class, Functions and Methods
### Aliases: aggregate aggregate.timeSeries aggregate-methods
###   aggregate,timeSeries-method daily2weekly daily2monthly
### Keywords: methods chron

### ** Examples

## Load Microsoft Data Set -
   x <- MSFT

## Aggregate by Weeks - 
   by <- timeSequence(from = start(x),  to = end(x), by = "week")
   aggregate(x, by, mean)

## Aggregate to Last Friday of Month -
   by <- unique(timeLastNdayInMonth(time(x), 5))
   X <- aggregate(x, by, mean)
   X
   dayOfWeek(time(X))
   isMonthly(X)

## Aggregate to Last Day of Quarter -
   by <- unique(timeLastDayInQuarter(time(x)))
   X <-  aggregate(x, by, mean)
   X
   isQuarterly(X)
   
## Aggregate daily records to end of month records -
   X <- daily2monthly(x)
   X
   isMonthly(X)
   
## Aggregate da, ily records to end of week records -
   X <- daily2weekly(x, startOn="Fri")
   X
   dayOfWeek(time(X))
   



