library(totalcensus)


### Name: read_decennial
### Title: Read decennial census data
### Aliases: read_decennial

### ** Examples

## Not run: 
##D # read one table and one area from one state
##D aaa = read_decennial(
##D     year = 2010,
##D     states = "UT",
##D     table_contents = c("urban = P0020002", "rural = P0020005"),
##D     geo_headers = "CBSA",
##D     summary_level = "tract"
##D )
##D 
##D 
##D # read multiple table contents and areas from multiple states
##D bbb = read_decennial(
##D     year = 2010,
##D     states = c("UT", "RI"),
##D     table_contents = c("urban = P0020002", "rural = P0020005"),
##D     areas = c(
##D         "place = ut62360",
##D         "Providence city, RI",
##D         "cousub = ri41500",
##D         "cbsa = 39300"
##D     ),
##D     summary_level = "block"
##D )
##D 
##D 
##D # read table contents of all county subdivisions in Providence metro
##D library(data.table)
##D library(magrittr)
##D ccc <- read_decennial(
##D     year = 2010,
##D     states = "US",
##D     table_contents = c("urban = P0020002", "rural = P0020005"),
##D     geo_headers = c("NAME", "CBSA"),
##D     summary_level = "county subdivision",
##D     geo_comp = "*"
##D ) %>%
##D     .[CBSA == "39300"]
## End(Not run)




