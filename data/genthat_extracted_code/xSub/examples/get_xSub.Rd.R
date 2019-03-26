library(xSub)


### Name: get_xSub
### Title: Get xSub file
### Aliases: get_xSub

### ** Examples

# Check which countries are available for ACLED
info_xSub(data_source="ACLED")

# Download ACLED data for Egypt, at country-year level
my_file <- get_xSub(data_source = "ACLED",country_iso3 = "EGY",
           space_unit = "adm0",time_unit = "year")

# Download ACLED data for Egypt, at district-month level
## Not run: 
##D my_file <- get_xSub(data_source = "ACLED",country_iso3 = "EGY",
##D            space_unit = "adm2",time_unit = "month")
## End(Not run)

# With country name instead of ISO3 code
## Not run: 
##D my_file <- get_xSub(data_source = "ACLED",country_name = "Egypt",
##D            space_unit = "adm2",time_unit = "month")
## End(Not run)

## Not run: 
##D # Download ACLED data for Egypt, event level
##D my_file <- get_xSub(data_source = "ACLED",country_iso3 = "EGY",
##D            data_type = "event")
## End(Not run)

## Not run: 
##D # Download multiple source data for Egypt, at province-month level
##D my_file <- get_xSub(sources_type = "multiple",country_iso3 = "EGY",
##D            space_unit = "adm1",time_unit = "month", geo_window = "1 km", 
##D            time_window = "1 day", dyad_type = "undirected")
## End(Not run)



