library(datetimeutils)


### Name: last_weekday
### Title: Functions for Computing Days of the Week
### Aliases: last_weekday nth_weekday
### Keywords: chron

### ** Examples

## GOAL:     find the third Friday in March 2013
## SOLUTION: find the last Friday in February 2013 and 
##           shift forward by 3 weeks
last_weekday(5, as.Date("2013-02-01"), shift = 3)

## ... or much simpler
nth_weekday(5, as.Date("2013-03-01"), 3)




