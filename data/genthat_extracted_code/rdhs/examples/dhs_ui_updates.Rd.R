library(rdhs)


### Name: dhs_ui_updates
### Title: API request of DHS UI Updates
### Aliases: dhs_ui_updates

### ** Examples


## Not run: 
##D # The main use for the ui updates API will be to search for the last time
##D # there was a change to the UI. For example to return all the
##D # changes since 2018:
##D 
##D dat <- dhs_ui_updates(lastUpdate="20180101")
##D 
##D # A complete list of examples for how each argument to the ui updates API
##D # endpoint can be provided is given below, which is a copy of each of
##D # the examples listed in the API at:
##D 
##D # https://api.dhsprogram.com/#/api-uiupdates.cfm
##D 
##D 
##D dat <- dhs_ui_updates(lastUpdate="20150901",all_results=FALSE)
##D dat <- dhs_ui_updates(f="html",all_results=FALSE)
## End(Not run)



