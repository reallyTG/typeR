library(rdhs)


### Name: dhs_publications
### Title: API request of DHS Publications
### Aliases: dhs_publications

### ** Examples


## Not run: 
##D # A main use for the publications API endpoint is to find which surveys have
##D # a published report resulting from the conducted survey:
##D 
##D dat <- dhs_publications()
##D 
##D # A complete list of examples for how each argument to the publications
##D # API endpoint can be provided is given below, which is a
##D # copy of each of the examples listed in the API at:
##D 
##D # https://api.dhsprogram.com/#/api-publications.cfm
##D 
##D 
##D dat <- dhs_publications(countryIds="EG",all_results=FALSE)
##D dat <- dhs_publications(selectSurveys="latest",all_results=FALSE)
##D dat <- dhs_publications(indicatorIds="FE_FRTR_W_TFR",all_results=FALSE)
##D dat <- dhs_publications(surveyIds="SN2010DHS",all_results=FALSE)
##D dat <- dhs_publications(surveyYear="2010",all_results=FALSE)
##D dat <- dhs_publications(surveyYearStart="2006",all_results=FALSE)
##D dat <- dhs_publications(surveyYearStart="1991", surveyYearEnd="2006",
##D all_results=FALSE)
##D dat <- dhs_publications(surveyType="DHS",all_results=FALSE)
##D dat <- dhs_publications(surveyCharacteristicIds="32",all_results=FALSE)
##D dat <- dhs_publications(tagIds=1,all_results=FALSE)
##D dat <- dhs_publications(f="html",all_results=FALSE)
## End(Not run)



