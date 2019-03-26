library(rdhs)


### Name: dhs_countries
### Title: API request of DHS Countries
### Aliases: dhs_countries

### ** Examples


## Not run: 
##D # A common use for the countries API endpoint is to query which countries
##D # ask questions about a given topic. For example to find all countries that
##D # record data on malaria prevalence by RDT:
##D 
##D dat <- dhs_countries(indicatorIds = "ML_PMAL_C_RDT")
##D 
##D # Additionally you may want to know all the countries that have conducted
##D # MIS (malaria indicator surveys):
##D 
##D dat <- dhs_countries(surveyType="MIS")
##D 
##D # A complete list of examples for how each argument to the countries API
##D # endpoint can be provided is given below, which is a copy of each of
##D # the examples listed in the API at:
##D 
##D # https://api.dhsprogram.com/#/api-countries.cfm
##D 
##D 
##D dat <- dhs_countries(countryIds="EG",all_results=FALSE)
##D dat <- dhs_countries(indicatorIds="FE_FRTR_W_TFR",all_results=FALSE)
##D dat <- dhs_countries(surveyIds="SN2010DHS",all_results=FALSE)
##D dat <- dhs_countries(surveyYear="2010",all_results=FALSE)
##D dat <- dhs_countries(surveyYearStart="2006",all_results=FALSE)
##D dat <- dhs_countries(surveyYearStart="1991", surveyYearEnd="2006",
##D all_results=FALSE)
##D dat <- dhs_countries(surveyType="DHS",all_results=FALSE)
##D dat <- dhs_countries(surveyCharacteristicIds="32",all_results=FALSE)
##D dat <- dhs_countries(tagIds="1",all_results=FALSE)
##D dat <- dhs_countries(f="html",all_results=FALSE)
## End(Not run)



