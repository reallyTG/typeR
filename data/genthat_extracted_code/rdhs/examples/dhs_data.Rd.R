library(rdhs)


### Name: dhs_data
### Title: API request of DHS Indicator Data
### Aliases: dhs_data

### ** Examples


## Not run: 
##D # A common use for the indicator data API will be to search for a specific
##D # health indicator for a given country. For example to return the total
##D # malaria prevalence according to RDT, given by the indicator ML_PMAL_C_RDT,
##D # in Senegal since 2010:
##D 
##D dat <- dhs_data(
##D indicatorIds="ML_PMAL_C_RDT",
##D countryIds="SN",
##D surveyYearStart="2006"
##D )
##D 
##D # A complete list of examples for how each argument to the data api
##D # endpoint can be provided is given below, which is a copy of each of
##D # the examples listed in the API at:
##D 
##D # https://api.dhsprogram.com/#/api-data.cfm
##D 
##D 
##D dat <- dhs_data(countryIds="EG",all_results=FALSE)
##D dat <- dhs_data(indicatorIds="FE_FRTR_W_TFR",all_results=FALSE)
##D dat <- dhs_data(surveyIds="SN2010DHS",all_results=FALSE)
##D dat <- dhs_data(selectSurveys="latest",all_results=FALSE)
##D dat <- dhs_data(selectSurveys="byIndicator", indicatorIds="FE_CEBA_W_CH0",
##D all_results=FALSE)
##D dat <- dhs_data(surveyYear="2010",all_results=FALSE)
##D dat <- dhs_data(surveyYearStart="2006",all_results=FALSE)
##D dat <- dhs_data(surveyYearStart="1991", surveyYearEnd="2006",
##D all_results=FALSE)
##D dat <- dhs_data(surveyType="DHS",all_results=FALSE)
##D dat <- dhs_data(surveyCharacteristicIds="32",all_results=FALSE)
##D dat <- dhs_data(characteristicCategory="wealth quintile",all_results=FALSE)
##D dat <- dhs_data(breakdown="all", countryIds="AZ", characteristicLabel="6+",
##D all_results=FALSE)
##D dat <- dhs_data(tagIds="1",all_results=FALSE)
##D dat <- dhs_data(breakdown="subnational",all_results=FALSE)
##D dat <- dhs_data(breakdown="background",all_results=FALSE)
##D dat <- dhs_data(breakdown="all",all_results=FALSE)
##D dat <- dhs_data(f="html",all_results=FALSE)
##D dat <- dhs_data(f="geojson", returnGeometry="true",all_results=FALSE)
## End(Not run)



