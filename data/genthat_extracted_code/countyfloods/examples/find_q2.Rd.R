library(countyfloods)


### Name: find_q2
### Title: Get median flood for each gage
### Aliases: find_q2

### ** Examples

## Not run: 
##D miami_gages <- gage_extract("12086", start_date = "2000-01-01",
##D                             end_date = "2009-12-31")
##D miami_q2 <- find_q2(site_no = miami_gages$site_no)
##D 
##D va_counties <- get_county_cd("Virginia")
##D va_gages <- get_gages(va_counties, start_date = "2015-01-01", end_date = "2015-12-31")
##D va_q2 <- find_q2(va_gages$site_no)
## End(Not run)



