library(oec)


### Name: getdata
### Title: Downloads and processes the data from the API
### Aliases: getdata
### Keywords: functions

### ** Examples

## Not run: 
##D # The next examples can take more than 5 seconds to compute, and specially for large economies so 
##D # these are just shown without evaluation according to CRAN rules
##D 
##D # Run `country_codes` to display the full table of countries
##D 
##D # What does Chile export to China?  
##D # year 2015 - SITC (4 characters)
##D getdata("chl", "chn", 2015)
##D # or with explicit parameter
##D getdata("chl", "chn", 2015, "sitc")
##D 
##D # What does Chile export to China?  
##D # year 2015 - HS07 (4 and 6 characters)
##D getdata("chl", "chn", 2015, "hs07")
## End(Not run)



