library(datetimeutils)


### Name: end_of_period
### Title: Handling and Manipulating Dates and Times
### Aliases: day_of_month<- day_of_month mday<- mday end_of_month
###   end_of_year end_of_previous_year end_of_previous_month first_of_month
###   first_of_year is_leapyear month year
### Keywords: chron

### ** Examples

## vectorisation: x *or* shift (but not both)
end_of_month(as.Date("2013-01-15"), shift = c(-1, 0, 1))
end_of_month(as.Date("2013-01-15") + 0:100)


day_of_month(d <- as.Date("2013-01-22"))
day_of_month(d) <- 5
d



