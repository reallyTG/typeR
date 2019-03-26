library(lubridate)


### Name: interval
### Title: Utilities for creation and manipulation of 'Interval' objects
### Aliases: interval %--% is.interval int_start int_start<- int_end
###   int_end<- int_length int_flip int_shift int_overlaps int_standardize
###   int_aligns int_diff

### ** Examples

interval(ymd(20090201), ymd(20090101))

date1 <- ymd_hms("2009-03-08 01:59:59")
date2 <- ymd_hms("2000-02-29 12:00:00")
interval(date2, date1)
interval(date1, date2)
span <- interval(ymd(20090101), ymd(20090201))

### ISO Intervals

interval("2007-03-01T13:00:00Z/2008-05-11T15:30:00Z")
interval("2007-03-01T13:00:00Z/P1Y2M10DT2H30M")
interval("P1Y2M10DT2H30M/2008-05-11T15:30:00Z")
interval("2008-05-11/P2H30M")

### More permisive parsing (as long as there are no intermittent / characters)
interval("2008 05 11/P2hours 30minutes")
interval("08 05 11/P 2h 30m")

is.interval(period(months= 1, days = 15)) # FALSE
is.interval(interval(ymd(20090801), ymd(20090809))) # TRUE
int <- interval(ymd("2001-01-01"), ymd("2002-01-01"))
int_start(int)
int_start(int) <- ymd("2001-06-01")
int

int <- interval(ymd("2001-01-01"), ymd("2002-01-01"))
int_end(int)
int_end(int) <- ymd("2002-06-01")
int
int <- interval(ymd("2001-01-01"), ymd("2002-01-01"))
int_length(int)
int <- interval(ymd("2001-01-01"), ymd("2002-01-01"))
int_flip(int)
int <- interval(ymd("2001-01-01"), ymd("2002-01-01"))
int_shift(int, duration(days = 11))
int_shift(int, duration(hours = -1))
int1 <- interval(ymd("2001-01-01"), ymd("2002-01-01"))
int2 <- interval(ymd("2001-06-01"), ymd("2002-06-01"))
int3 <- interval(ymd("2003-01-01"), ymd("2004-01-01"))

int_overlaps(int1, int2) # TRUE
int_overlaps(int1, int3) # FALSE
int <- interval(ymd("2002-01-01"), ymd("2001-01-01"))
int_standardize(int)
int1 <- interval(ymd("2001-01-01"), ymd("2002-01-01"))
int2 <- interval(ymd("2001-06-01"), ymd("2002-01-01"))
int3 <- interval(ymd("2003-01-01"), ymd("2004-01-01"))

int_aligns(int1, int2) # TRUE
int_aligns(int1, int3) # FALSE
dates <- now() + days(1:10)
int_diff(dates)



