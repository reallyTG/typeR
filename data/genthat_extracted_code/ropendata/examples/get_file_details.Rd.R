library(ropendata)


### Name: get_file_details
### Title: Retrieve details for a given file from a specific Rapid7 Open
###   Data study
### Aliases: get_file_details

### ** Examples

try(
  get_file_details("sonar.fdns_v2", "2018-06-15-1529049662-fdns_aaaa.json.gz"),
  silent=TRUE
) -> details



