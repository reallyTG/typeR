library(rdhs)


### Name: dhs_info
### Title: API request of DHS Info
### Aliases: dhs_info

### ** Examples


## Not run: 
##D # The main use for the info API  will be to confirm the version of the API
##D # being used to providing the most current citation for the data.
##D 
##D dat <- dhs_info(infoType="version")
##D 
##D # A complete list of examples for how each argument to the info API
##D # endpoint can be provided is given below, which is a copy of each of
##D # the examples listed in the API at:
##D 
##D # https://api.dhsprogram.com/#/api-info.cfm
##D 
##D 
##D dat <- dhs_info(infoType="version",all_results=FALSE)
##D dat <- dhs_info(infoType="citation",all_results=FALSE)
##D dat <- dhs_info(f="html",all_results=FALSE)
## End(Not run)



