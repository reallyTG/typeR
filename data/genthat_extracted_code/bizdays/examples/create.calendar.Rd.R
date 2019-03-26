library(bizdays)


### Name: create.calendar
### Title: Creates calendars
### Aliases: create.calendar create.calendar

### ** Examples

# ANBIMA's calendar (from Brazil)
cal <- create.calendar("Brazil/ANBIMA", holidays=holidaysANBIMA, weekdays=c("saturday", "sunday"))

# ACTUAL calendar
cal <- create.calendar("Actual")

# named calendars can be accessed by its name
create.calendar(name="Actual")
bizdays('2016-01-01', '2016-03-14', 'Actual')



