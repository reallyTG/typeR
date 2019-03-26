library(mondate)


### Name: mondate-class
### Title: Class "mondate"
### Aliases: mondate-class
### Keywords: classes

### ** Examples

# See the \code{mondate-methods} section for an
# explanation of the \code{mondate} method below.

# January 1, 2010 in US displayFormat
mondate("1-1-2010") 

# generate 10 random dates in calendar year 2000; will be
# displayed in local format
mondate(runif(10,0,12)) 

# Change the default format so that the character representation of the date
#   sorts in chronological order.
options(mondate.displayFormat = "%Y-%m-%d")
# January
mondate(runif(10,0,12)) 

# generate 10 random dates in calendar year 2010;
# date arithmetic results will be reported in units of "years"
mondate(10+runif(10),timeunits="years") 



