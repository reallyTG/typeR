library(tidyqwi)


### Name: get_qwi
### Title: get_qwi
### Aliases: get_qwi

### ** Examples

## Not run: 
##D library(tidyqwi)
##D 
##D # One state, one year
##D nc_qwi <- get_qwi(years = "2010",
##D                states = "11",
##D                geography = "county",
##D                apikey =  census_key,
##D                endpoint = "rh",
##D                variables = c("sEmp", "Emp"), all_groups = FALSE,
##D                industry_level = "2", processing = "sequential")
##D 
##D # Multiple states. multiple years
##D qwi_multi_year <- get_qwi(years = c("2010", "2011", "2012"),
##D                states = c("NC", "SC"),
##D                geography = "county",
##D                apikey =  census_key,
##D                endpoint = "rh",
##D                variables = c("sEmp", "Emp"), all_groups = FALSE,
##D                industry_level = "2", processing = "sequential")
## End(Not run)




