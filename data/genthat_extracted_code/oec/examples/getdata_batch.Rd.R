library(oec)


### Name: getdata_batch
### Title: Convenient wrapper for getdata
### Aliases: getdata_batch
### Keywords: functions

### ** Examples

## Not run: 
##D # The next examples can take more than 5 seconds to compute, and specially for large economies so 
##D # these are just shown without evaluation according to CRAN rules
##D 
##D # Run `country_codes` to display the full table of countries
##D 
##D # What does Chile export to China?  
##D # years 2010 to 2015 - SITC (4 characters)
##D getdata_batch("chl", "chn", 2010, 2015)
##D # or with explicit parameters
##D getdata_batch("chl", "chn", 2010, 2015, "sitc", 1)
##D 
##D # What does Chile export to China?  
##D # years 2010 to 2015 - HS07 (4 and 6 characters)
##D getdata_batch("chl", "chn", 2010, 2015, "hs07")
##D 
##D # What does Chile export to China?  
##D # years 2010 and 2012 - HS07 (4 and 6 characters)
##D getdata_batch("chl", "chn", 2010, 2012, "hs07", 2)
## End(Not run)



