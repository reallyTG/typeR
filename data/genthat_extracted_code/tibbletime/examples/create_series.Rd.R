library(tibbletime)


### Name: create_series
### Title: Create a 'tbl_time' object with a sequence of regularly spaced
###   dates
### Aliases: create_series

### ** Examples


# Every day in 2013
create_series(~'2013', 'daily')

# Every other day in 2013
create_series(~'2013', '2 d')

# Every quarter in 2013
create_series(~'2013', '1 q')

# Daily series for 2013-2015
create_series('2013' ~ '2015', '1 d')

# Minute series for 2 months
create_series('2012-01' ~ '2012-02', 'M')

# Second series for 2 minutes
create_series('2011-01-01 12:10:00' ~ '2011-01-01 12:12:00', 's')

# Date class
create_series(~'2013', 'day', class = "Date")

# yearmon class
create_series(~'2013', 'month', class = "yearmon")

# hms class. time_formula specified as HH:MM:SS here
create_series('00:00:00' ~ '12:00:00', 'second' , class = "hms")

# Subsecond series
create_series('2013' ~ '2013-01-01 00:00:01', period = "10 millisec")
milli <- create_series('2013' ~ '2013-01-01 00:00:01', period = ".1 sec")
# Check that 'milli' is correct by running:
# options("digits.secs" = 4)
# options("digits" = 18)
# milli$date
# as.numeric(milli$date)





