library(splusTimeDate)


### Name: timeDate-class
### Title: Time and Date Class
### Aliases: timeDate-class [,timeDate-method
###   [<-,timeDate,ANY,ANY,timeDate-method as.character,timeDate-method
###   coerce,Date,timeDate-method coerce,character,timeDate-method
###   coerce,POSIXct,timeDate-method coerce,POSIXlt,timeDate-method
###   coerce,numeric,timeDate-method coerce,timeDate,character-method
###   coerce,timeDate,integer-method coerce,timeDate,numeric-method
###   format,timeDate-method show,timeDate-method summary,timeDate-method
###   shiftPositions,timeDate-method timeConvert,timeDate-method
### Keywords: chron classes

### ** Examples

## The default format for input is initially:
##    "%m[/][.]%d[/][,]%y [%H[:%M[:%S[.%N]]][%p][[(]%3Z[)]]]"
## This allows reading strings such as
##    "Jan 22 1997", "January 22, 1997", "1/22/97", "1/22/97 2PM"
## The default format for output is initially:
##    "%02m/%02d/%Y %02H:%02M:%02S.%03N"
## Another choice would be
##    "%A %B %d, %Y %I:%02M %p"
## These would result in the following output:
##    "01/22/1997 14:34:45.025" and "Thursday January 22, 1997 2:34 PM"



