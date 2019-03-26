library(dint)


### Name: get_year
### Title: Get Year, Quarter, Month or Isoweek
### Aliases: get_year get_quarter get_month get_isoweek get_isoyear

### ** Examples

x <- date_yq(2016, 2)
get_year(x)
## Not run: 
##D library(lubridate)
##D year(x)
## End(Not run)

x <- date_yq(2016, 2)
get_quarter(x)
## Not run: 
##D library(lubridate)
##D quarter(x)
## End(Not run)

x <- date_yq(2016, 2)
get_month(x)
## Not run: 
##D library(lubridate)
##D month(x)
## End(Not run)
x <- date_yw(2016, 2)
get_isoweek(x)

get_isoyear(as.Date("2018-01-01"))
get_isoyear(as.Date("2016-01-01"))



