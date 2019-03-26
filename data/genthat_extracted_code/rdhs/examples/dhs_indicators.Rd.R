library(rdhs)


### Name: dhs_indicators
### Title: API request of DHS Indicators
### Aliases: dhs_indicators

### ** Examples

## Not run: 
##D # A common use for the indicators data API will be to search for a list of
##D # health indicators within a given characteristic category, such as anemia
##D # testing, HIV prevalence, micronutrients etc. For example to return all the
##D # indicators relating to malaria testing by RDTs:
##D 
##D dat <- dhs_indicators(surveyCharacteristicIds="90")
##D 
##D # A list of the different `surveyCharacteristicIds` can be found
##D # [here](https://api.dhsprogram.com/rest/dhs/surveycharacteristics?f=html)
##D 
##D # A complete list of examples for how each argument to the indicator API
##D # endpoint can be provided is given below, which is a copy of each of
##D # the examples listed in the API at:
##D 
##D # https://api.dhsprogram.com/#/api-indicators.cfm
##D 
##D 
##D dat <- dhs_indicators(countryIds="EG",all_results=FALSE)
##D dat <- dhs_indicators(indicatorIds="FE_FRTR_W_TFR",all_results=FALSE)
##D dat <- dhs_indicators(surveyIds="SN2010DHS",all_results=FALSE)
##D dat <- dhs_indicators(surveyYear="2010",all_results=FALSE)
##D dat <- dhs_indicators(surveyYearStart="2006",all_results=FALSE)
##D dat <- dhs_indicators(surveyYearStart="1991", surveyYearEnd="2006",
##D all_results=FALSE)
##D dat <- dhs_indicators(surveyType="DHS",all_results=FALSE)
##D dat <- dhs_indicators(surveyCharacteristicIds="32",all_results=FALSE)
##D dat <- dhs_indicators(tagIds="1",all_results=FALSE)
##D dat <- dhs_indicators(f="html",all_results=FALSE)
## End(Not run)



