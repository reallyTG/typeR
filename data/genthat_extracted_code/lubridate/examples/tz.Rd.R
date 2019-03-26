library(lubridate)


### Name: tz
### Title: Get/set time zone component of a date-time
### Aliases: tz tz<-
### Keywords: chron manip methods utilities

### ** Examples

x <- ymd("2012-03-26")
tz(x)
tz(x) <- "GMT"
x
## Not run: 
##D tz(x) <- "America/New_York"
##D x
##D tz(x) <- "America/Chicago"
##D x
##D tz(x) <- "America/Los_Angeles"
##D x
##D tz(x) <- "Pacific/Honolulu"
##D x
##D tz(x) <- "Pacific/Auckland"
##D x
##D tz(x) <- "Europe/London"
##D x
##D tz(x) <- "Europe/Berlin"
##D x
##D 
##D Sys.setenv(TZ = "UTC")
##D now()
##D tz(now())
##D Sys.unsetenv("TZ")
## End(Not run)



