library(physiology)


### Name: age_from_dates
### Title: age from birth and reference dates
### Aliases: age_from_dates

### ** Examples

age_from_dates("2014-11-08", "2014-12-31", unit = "day")
age_from_dates("2014-11-08", "2014-12-31", unit = "day")
age_from_dates("1981-07-09", "2014-06-29", unit = "year")
# age must be zero or positive, may be in future, or error is thrown
## Not run: 
##D age_from_dates("2120-10-10", "2119-01-01")
## End(Not run)
# leap days work: we are just using internal R date manipulation
age_from_dates("2000-02-28", "2000-03-01", unit = "day")
age_from_dates("2004-02-28", "2004-03-01", unit = "day")
age_from_dates("1900-02-28", "1900-03-01", unit = "day")
age_from_dates("1901-02-28", "1901-03-01", unit = "day")



