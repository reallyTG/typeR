library(totalcensus)


### Name: convert_fips_to_names
### Title: convert fips codes to names of a geographies
### Aliases: convert_fips_to_names

### ** Examples

aaa <- convert_fips_to_names(c("11", "44"))
# [1] "DC" "RI"

bbb <- convert_fips_to_names(c("001", "013"), states = c("RI", "MA"), geo_header = "COUNTY")
# [1] "Bristol County" "Hampden County"

## Not run: 
##D # The only purpose of downloading data to temporary directory is to test the
##D # following examples. Do not do it when you have data in your local computer.
##D tmp <- tempdir()
##D url <- "https://s3.amazonaws.com/gl-shared-data/generated_census_data.zip"
##D download.file(url, paste0(tmp, "/tmp.zip"))
##D unzip(
##D     paste0(tmp, "/tmp.zip"),
##D     exdir = paste0(tmp, "/generated_data")
##D )
##D Sys.setenv(PATH_TO_CENSUS = tmp)
##D 
##D convert_fips_to_names(
##D     FIPs = c("14140", "76030"),
##D     states = c("RI", "MA"),
##D     geo_header = "PLACE",
##D     in_states = c("RI", "MA")
##D )
##D # [1] "Central Falls city" "Westfield city"
##D 
##D convert_fips_to_names(
##D     FIPs = c("39300", "46740"),
##D     states = c(NA, NA),
##D     geo_header = "CBSA",
##D     in_states = "US"
##D )
##D # [1] "Providence-New Bedford-Fall River, RI-MA Metro Area" "Valley, AL Micro Area"
## End(Not run)




