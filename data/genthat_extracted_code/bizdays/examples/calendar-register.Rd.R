library(bizdays)


### Name: calendar-register
### Title: Calendars register
### Aliases: calendar-register calendars remove.calendars has.calendars

### ** Examples

# ACTUAL calendar
cal <- create.calendar("Actual")
cal <- calendars()[["Actual"]]
remove.calendars("Actual")
# lists registered calendars
calendars()
has.calendars(c("actual", "weekends"))



