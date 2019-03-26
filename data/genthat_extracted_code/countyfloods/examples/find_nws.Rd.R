library(countyfloods)


### Name: find_nws
### Title: Get National Weather Service (NWS) flood stage/discharge levels
###   for gages.
### Aliases: find_nws

### ** Examples


va_counties <- get_county_cd("Virginia")
va_gages <- get_gages(va_counties, start_date = "2015-01-01",
                      end_date = "2015-12-31")
va_nws <- find_nws(site_no = va_gages$site_no, type = "moderate")




