library(rdhs)


### Name: dhs_data_updates
### Title: API request of DHS Data Updates
### Aliases: dhs_data_updates

### ** Examples


## Not run: 
##D # The API endpoint for the data updates available within the DHS
##D # is a very useful endpoint, which is used a lot within `rdhs`. For example,
##D # we use it to keep the end user's cache up to date. For example to find all
##D # updates that have occurred in 2018:
##D 
##D dat <- dhs_data_updates(lastUpdate="20180101")
##D 
##D # A complete list of examples for how each argument to the data updates
##D # API endpoint can be provided is given below, which is a
##D # copy of each of the examples listed in the API at:
##D 
##D # https://api.dhsprogram.com/#/api-dataupdates.cfm
##D 
##D 
##D dat <- dhs_data_updates(lastUpdate="20150901",all_results=FALSE)
##D dat <- dhs_data_updates(f="html",all_results=FALSE)
## End(Not run)



