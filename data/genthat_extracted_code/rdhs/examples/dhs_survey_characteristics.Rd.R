library(rdhs)


### Name: dhs_survey_characteristics
### Title: API request of DHS Survey Characteristics
### Aliases: dhs_survey_characteristics

### ** Examples


## Not run: 
##D # A good use for the survey characteristics API endpoint is to query what the
##D # IDs are for each survey characteristic. These are useful for passing as
##D # arguments to other API endpoints.For example to show all the ids:
##D 
##D dat <- dhs_survey_characteristics()
##D 
##D # Or if your analysis is foucssed on a particular country, and you want to
##D # see all the characteristics surveyed for e.g. Senegal
##D 
##D dat <- dhs_countries(countryIds="SN")
##D 
##D # A complete list of examples for how each argument to the survey
##D # characteristics API endpoint can be provided is given below, which is a
##D # copy of each of the examples listed in the API at:
##D 
##D # https://api.dhsprogram.com/#/api-surveycharacteristics.cfm
##D 
##D 
##D dat <- dhs_survey_characteristics(countryIds="EG",all_results=FALSE)
##D dat <- dhs_survey_characteristics(indicatorIds="FE_FRTR_W_TFR",
##D all_results=FALSE)
##D dat <- dhs_survey_characteristics(surveyIds="SN2010DHS,all_results=FALSE")
##D dat <- dhs_survey_characteristics(surveyYear="2010,all_results=FALSE")
##D dat <- dhs_survey_characteristics(surveyYearStart="2006",all_results=FALSE)
##D dat <- dhs_survey_characteristics(surveyYearStart="1991",
##D surveyYearEnd="2006",all_results=FALSE)
##D dat <- dhs_survey_characteristics(surveyType="DHS",all_results=FALSE)
##D dat <- dhs_survey_characteristics(f="html",all_results=FALSE)
## End(Not run)



