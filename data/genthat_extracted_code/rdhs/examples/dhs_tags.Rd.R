library(rdhs)


### Name: dhs_tags
### Title: API request of DHS Tags
### Aliases: dhs_tags

### ** Examples


## Not run: 
##D # A good use for the tags API endpoint is to query what the
##D # IDs are for each tag. These are useful for passing as
##D # arguments to other API endpoints.For example to show all the ids:
##D 
##D dat <- dhs_tags()
##D 
##D # Or if your analysis is foucssed on a particular country, and you want to
##D # see all the characteristics surveyed for e.g. Senegal
##D 
##D dat <- dhs_tags(countryIds="SN")
##D 
##D # A complete list of examples for how each argument to the survey
##D # tags API endpoint can be provided is given below, which is a
##D # copy of each of the examples listed in the API at:
##D 
##D # https://api.dhsprogram.com/#/api-tags.cfm
##D 
##D 
##D dat <- dhs_tags(countryIds="EG",all_results=FALSE)
##D dat <- dhs_tags(indicatorIds="FE_FRTR_W_TFR",all_results=FALSE)
##D dat <- dhs_tags(surveyIds="SN2010DHS",all_results=FALSE)
##D dat <- dhs_tags(surveyYear="2010",all_results=FALSE)
##D dat <- dhs_tags(surveyYearStart="2006",all_results=FALSE)
##D dat <- dhs_tags(surveyYearStart="1991", surveyYearEnd="2006",
##D all_results=FALSE)
##D dat <- dhs_tags(surveyType="DHS",all_results=FALSE)
##D dat <- dhs_tags(f="html",all_results=FALSE)
## End(Not run)



