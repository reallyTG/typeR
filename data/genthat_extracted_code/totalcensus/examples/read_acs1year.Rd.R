library(totalcensus)


### Name: read_acs1year
### Title: Read summary file 1 of ACS 1-year estimates
### Aliases: read_acs1year

### ** Examples

## Not run: 
##D # read summary data using areas of selected cities
##D aaa <- read_acs1year(
##D     year = 2016,
##D     states = c("UT", "RI"),
##D     table_contents = c("male = B01001_002", "female = B01001_026"),
##D     areas = c("Salt Lake City city, UT",
##D               "Providence city, RI",
##D               "PLACE = RI19180"),
##D     summary_level = "place",
##D     with_margin = TRUE
##D )
##D 
##D 
##D # read data using geoheaders - all major counties
##D bbb <- read_acs1year(
##D     year = 2015,
##D     states = c("UT", "RI"),
##D     table_contents = c("male = B01001_002", "female = B01001_026"),
##D     geo_headers = c("COUNTY"),
##D     summary_level = "county",
##D     with_margin = TRUE
##D )
## End(Not run)




