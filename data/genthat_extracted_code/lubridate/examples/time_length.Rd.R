library(lubridate)


### Name: time_length
### Title: Compute the exact length of a time span
### Aliases: time_length time_length,Interval-method
### Keywords: chron math methods period

### ** Examples

int <- interval(ymd("1980-01-01"), ymd("2014-09-18"))
time_length(int, "week")

# Exact age
time_length(int, "year")

# Age at last anniversary
trunc(time_length(int, "year"))

# Example of difference between intervals and durations
int <- interval(ymd("1900-01-01"), ymd("1999-12-31"))
time_length(int, "year")
time_length(as.duration(int), "year")



