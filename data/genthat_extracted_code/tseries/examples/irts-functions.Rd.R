library(tseries)


### Name: irts-functions
### Title: Basic Functions for Irregular Time-Series Objects
### Aliases: irts-functions approx.irts daysecond is.businessday is.weekend
###   read.irts weekday write.irts
### Keywords: ts

### ** Examples

n <- 10
t <- cumsum(rexp(n, rate = 0.1))
v <- rnorm(n)
x <- irts(t, v)

daysecond(x)
weekday(x)
is.businessday(x)
is.weekend(x)
x

approx.irts(x, seq(ISOdatetime(1970, 1, 1, 0, 0, 0, tz = "GMT"),
            by = "10 secs", length = 7), rule = 2)

## Not run: 
##D file <- tempfile()
##D 
##D # To write an irregular time-series object to a file one might use
##D write.irts(x, file = file)
##D 
##D # To read an irregular time-series object from a file one might use
##D read.irts(file = file)
##D 
##D unlink(file)
## End(Not run)



