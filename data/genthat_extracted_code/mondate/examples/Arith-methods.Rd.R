library(mondate)


### Name: Arith-methods
### Title: Methods for Function Group Arith on mondate Objects
### Aliases: Arith-methods Arith,mondate,mondate-method
###   Arith,mondate,numeric-method Arith,numeric,mondate-method
###   Arith,mondate,array-method Arith,array,mondate-method MonthsBetween
###   MonthsBetween-methods MonthsBetween,mondate,mondate-method
###   YearsBetween YearsBetween-methods YearsBetween,mondate,mondate-method
###   DaysBetween DaysBetween-methods DaysBetween,mondate,mondate-method
###   +-methods +,mondate,difftime-method --methods
###   -,mondate,difftime-method -,mondate,mondate-method
### Keywords: methods arith

### ** Examples

M <- mondate("1-1-2010") # will display in U.S. date format
M - 1:12 # the 1st of the month for all months in 2009
       # in reverse chronological order; inherits M's displayFormat

x <- mondate(matrix(12 * 1:4, 2, 2)) # 2x2 matrix of 2000-2003 year ends
x                                
y <- x + 12                          # one year later, also a matrix
y
y - x                      # 2x2 matrix of 12s, with an attribute ("months")
MonthsBetween(x, y)        # same, without the attribute
YearsBetween(x, y)
DaysBetween(x, y)

## Use difftime object to add, subtract secs, days, weeks, months, years
x <- mondate(1)            # January 31, 2000
y <- as.difftime(1, units = "days")
x + y
x - y
yw <- as.difftime(1, units = "weeks")
x + yw
x - yw
x + as.difftime(1, , "days")
x + as.difftime(86400, , "secs")

x <- mondate.ymd(2012, 2, 29)  # leap day
x + as.difftime(1, , "years")  # last day of February 2013, not a leap day
x - as.difftime(1, , "months") # not the last day of January




