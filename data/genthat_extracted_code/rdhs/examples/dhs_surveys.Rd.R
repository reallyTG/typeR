library(rdhs)


### Name: dhs_surveys
### Title: API request of DHS Surveys
### Aliases: dhs_surveys

### ** Examples


## Not run: 
##D # A common use for the surveys API endpoint is to query which countries
##D # have conducted surveys since a given year, e.g. since 2010
##D 
##D dat <- dhs_surveys(surveyYearStart="2010")
##D 
##D # Additionally, some countries conduct non DHS surveys, but the data for
##D # thse is also available within the DHS website/API. To query these:
##D 
##D dat <- dhs_surveys(surveyType="MIS")
##D 
##D # Lastly, you may be interested to know about anything peculiar about a
##D # particular survey's implementation. This can be found by looking within
##D # the footnotes variable within the data frame returned. For example, the
##D # Madagascar 2013 MIS:
##D 
##D dat$Footnotes[dat$SurveyId == "MD2013MIS"]
##D 
##D # A complete list of examples for how each argument to the surveys API
##D # endpoint can be provided is given below, which is a copy of each of
##D # the examples listed in the API at:
##D 
##D # https://api.dhsprogram.com/#/api-surveys.cfm
##D 
##D 
##D dat <- dhs_surveys(countryIds="EG",all_results=FALSE)
##D dat <- dhs_surveys(indicatorIds="FE_FRTR_W_TFR",all_results=FALSE)
##D dat <- dhs_surveys(selectSurveys="latest",all_results=FALSE)
##D dat <- dhs_surveys(surveyIds="SN2010DHS",all_results=FALSE)
##D dat <- dhs_surveys(surveyYear="2010",all_results=FALSE)
##D dat <- dhs_surveys(surveyYearStart="2006",all_results=FALSE)
##D dat <- dhs_surveys(surveyYearStart="1991", surveyYearEnd="2006",
##D all_results=FALSE)
##D dat <- dhs_surveys(surveyType="DHS",all_results=FALSE)
##D dat <- dhs_surveys(surveyStatus="Surveys",all_results=FALSE)
##D dat <- dhs_surveys(surveyStatus="Completed",all_results=FALSE)
##D dat <- dhs_surveys(surveyStatus="Ongoing",all_results=FALSE)
##D dat <- dhs_surveys(surveyStatus="All",all_results=FALSE)
##D dat <- dhs_surveys(surveyCharacteristicIds="32",all_results=FALSE)
##D dat <- dhs_surveys(tagIds="1",all_results=FALSE)
##D dat <- dhs_surveys(f="html",all_results=FALSE)
## End(Not run)



