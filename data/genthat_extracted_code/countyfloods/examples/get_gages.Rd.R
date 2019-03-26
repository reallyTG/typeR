library(countyfloods)


### Name: get_gages
### Title: Get all gage site numbers for a county
### Aliases: get_gages

### ** Examples

## Not run: 
##D get_gages("12086", start_date = "1988-01-01", end_date = "2015-01-01")
##D 
##D va_counties <- get_county_cd("Virginia")
##D va_gages <- get_gages(va_counties, start_date = "2015-01-01",
##D                       end_date = "2015-12-31")
##D # Equivalent with piping
##D library(dplyr)
##D va_gages <- get_county_cd("Virginia") %>%
##D    get_gages(start_date = "2015-01-01", end_date = "2015-12-31")
## End(Not run)



