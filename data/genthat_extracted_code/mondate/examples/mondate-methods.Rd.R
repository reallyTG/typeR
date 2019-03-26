library(mondate)


### Name: mondate-methods
### Title: Create an instance of the mondate class
### Aliases: mondate mondate-methods mondate,ANY-method
###   mondate,array-method mondate,character-method mondate,factor-method
###   mondate,Date-method mondate,mondate-method mondate,numeric-method
###   mondate,matrix-method mondate,POSIXt-method mondate,missing-method
### Keywords: methods

### ** Examples

mondate("1-31-2010") # Jan. 31, 2010
mondate(60)          # 60 months after 12/31/1999, so Dec. 31, 2004
dat <- as.Date("2010-1-31")
(M <- mondate(dat))    # Jan. 31, 2010
x <- 12 * 1:6
mondate(x)           # first 6 yearends in 2000's
y <- x + 12
mondate(cbind(x,y))  # bounding dates of first 6 years of millennium
(y <- mondate(1:6,timeunits="years")) # first 6 yearends, 'years' timeunits 
# The results of date arithmetic on y will be displayed in "years".
# E.g., the differences of y can be calculated as:
tail(y,-1) - head(y,-1)# vector of five 1's, with "timeunits" attribute = "years"
as.numeric(x)
as.numeric(y)        # the underlying numeric representations are the same

# Demonstrating "infinite" dates
y <- c(y,Inf)
y                    # last element shows as Inf
tail(y,-1) - head(y,-1)# last element is now infinity

# The zoo examples point out a difference between zoo and mondate.
#   zoo assumes that the zero-th part of a month or quarter is the first
#   day of the month or quarter, whereas mondate assumes that it is 
#   the instant before the first day of the month or quarter.
# Since frac=0 is zoo's as.Date coersion default, a month or quarter in 
#   zoo's sense converts to the end of the first day rather than
#   the beginning.
library(zoo)
x <- ts(1:10, frequency = 4, start = c(1959, 2)) # starting 2nd qtr of 1959
x
# There is no method for class 'ts' so x is coerced (successfully) 
#   because that class has an as.Date method, but with a warning.
# The result is a vector of length 10 representing the close of business
#   at the end of the first day of each of the given quarters.
mondate(x)      

# The yearmon class will identify any day in June 2010 with that month.
as.yearmon("2010-6-15") 
mondate(as.yearmon("2010-6-15"))         # end of first day of June 2010
mondate(as.yearmon("2010-6-15", frac=1)) # end of  last day of June 2010
mondate(as.yearqtr("2010-2", frac=1))    # same

# The if missing, displayFormat will be determined from the character input
x <- mondate("2010-12-31")
x               # x displays in the input European format
# The provided, displayFormat must match the format of the character input
#   or NA's will result.
mondate("2010-12-31", displayFormat = "%m-%d-%Y") # results in NA

# Always display x using just the year
x <- mondate(as.Date("2012-3-1"), displayFormat="%Y")
x                # shows as the year 2012, but month and day are nevertheless retained
month(x)         # 3
day(x)           # 1

# Change the default displayFormat to only display the year and month
options(mondate.displayFormat = "%Y-%m")
y <- mondate(as.Date("2013-12-31"))
y
# mondate: timeunits="months"
# [1] 2013-12
# Previous mondate instances retain their display formats:
x
# mondate: timeunits="months"
# [1] 2012






