library(xSub)


### Name: get_xSub_multi
### Title: Get xSub files for multiple countries
### Aliases: get_xSub_multi

### ** Examples

# Check which countries are available for GED
info_xSub(data_source="GED")

# Example with two countries
my_file <- get_xSub_multi(data_source = "PITF",country_iso3 = c("ALB","ARM"),
           space_unit = "adm0",time_unit = "year")

# Example with two countries
## Not run: 
##D my_file <- get_xSub_multi(data_source = "GED",country_iso3 = c("EGY","AGO"),
##D            space_unit = "adm1",time_unit = "month")
## End(Not run)

# Example with two countries, multiple sources, event-level
## Not run: 
##D my_file <- get_xSub_multi(sources_type = "multiple",data_type="event",country_iso3 = c("EGY","AGO"))
## End(Not run)

# Example with all countries (WARNING: this can take a long time to run)
## Not run: 
##D my_file <- get_xSub_multi(data_source = "BeissingerProtest",country_iso3 = NULL,
##D            space_unit = "adm0",time_unit = "year")
## End(Not run)



