library(totalcensus)


### Name: read_acs5year
### Title: Read ACS 5-year estimates
### Aliases: read_acs5year

### ** Examples

## Not run: 
##D # read data using areas
##D aaa <- read_acs5year(
##D     year = 2015,
##D     states = c("UT", "RI"),
##D     table_contents = c(
##D         "white = B02001_002",
##D         "black = B02001_003",
##D         "asian = B02001_005"
##D     ),
##D     areas = c(
##D         "Lincoln town, RI",
##D         "Salt Lake City city, UT",
##D         "Salt Lake City metro",
##D         "Kent county, RI",
##D         "COUNTY = UT001",
##D         "PLACE = UT62360"
##D     ),
##D     summary_level = "block group",
##D     with_margin = TRUE
##D )
##D 
##D 
##D # read data using geoheaders
##D bbb <- read_acs5year(
##D     year = 2015,
##D     states = c("UT", "RI"),
##D     table_contents = c("male = B01001_002", "female = B01001_026"),
##D     geo_headers = "PLACE",
##D     summary_level = "block group"
##D )
## End(Not run)




