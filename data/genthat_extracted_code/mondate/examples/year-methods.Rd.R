library(mondate)


### Name: year-month-day-methods
### Title: Useful Methods for Class mondate
### Aliases: year-methods year,mondate-method year,Date-method
###   year,POSIXt-method year quarter-methods quarter,mondate-method
###   quarter,Date-method quarter,POSIXt-method quarter month-methods
###   month,mondate-method month,Date-method month,POSIXt-method month
###   day-methods day,mondate-method day,Date-method day,POSIXt-method day
###   mondate.mdy mondate.ymd ymd
### Keywords: methods

### ** Examples

M <- mondate.mdy(6,30,2008)
year(M)     # 2008
month(M)    # 6
day(M)      # 30

mondate.ymd(2008,6,30)  # ditto
mondate.ymd(2008,6)     # ditto; 'day' argument is "missing" so
                        # returns the last day of the month
mondate.ymd(2008,1:12)  # all month-ends of 2008, a leapyear
# year-ends 2001 through 2013, displaying only the 4-digit year when shown
mondate.ymd(2001:2013, displayFormat = "%Y")
mondate.ymd(2010:2012, NA) # NA mondate vector of length 3
mondate.ymd(Inf,11,31)  # An infinite mondate even though only 30 days in 
                        # November
                        
x <- mondate.ymd(2013, 1:12) # month-ends in 2013
# Give x some shape
dim(x) <- 3:4
dimnames(x) <- list(A = letters[1:3], B = LETTERS[1:4])
# Return the quarter numbers in an array with the same shape and dimnames
quarter(x) 



