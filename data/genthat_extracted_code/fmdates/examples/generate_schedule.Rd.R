library(fmdates)


### Name: generate_schedule
### Title: Generate a date schedule
### Aliases: generate_schedule

### ** Examples

library (lubridate)
effective_date <- ymd('20120103')
termination_date <- ymd('20121203')
tenor <- months(3)
stub <- 'short_front'
bdc <- 'mf'
calendar <- AUSYCalendar()
eom_rule <- FALSE
generate_schedule(effective_date, termination_date, tenor, calendar,
 bdc, stub, eom_rule)



