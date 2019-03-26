library(bizdays)


### Name: calendar-import-export
### Title: Import and export calendars
### Aliases: calendar-import-export save_calendar load_calendar

### ** Examples

con <- tempfile(fileext = ".json")
save_calendar("actual", con)
load_calendar(con)



