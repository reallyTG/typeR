library(rdhs)


### Name: dhs_datasets
### Title: API request of DHS Datasets
### Aliases: dhs_datasets

### ** Examples


## Not run: 
##D # The API endpoint for the datasets available within the DHS website
##D # is a very useful endpoint, which is used a lot within `rdhs`. For example,
##D # it is used to find the file names and size of the dataset files, as well
##D # as when they were last modified. This enables us to see which datasets
##D # have been updated and may thus be out of date. For example to find all
##D # datasets that have been modified in 2018:
##D 
##D dat <- dhs_datasets()
##D dates <- rdhs:::mdy_hms(dat$FileDateLastModified)
##D years <- as.POSIXlt(dates, tz = tz(dates))$year + 1900
##D modified_in_2018 <- which(years == 2018)
##D 
##D # A complete list of examples for how each argument to the datasets
##D # API endpoint can be provided is given below, which is a
##D # copy of each of the examples listed in the API at:
##D 
##D # https://api.dhsprogram.com/#/api-datasets.cfm
##D 
##D 
##D dat <- dhs_datasets(countryIds="EG",all_results=FALSE)
##D dat <- dhs_datasets(selectSurveys="latest",all_results=FALSE)
##D dat <- dhs_datasets(surveyIds="SN2010DHS",all_results=FALSE)
##D dat <- dhs_datasets(surveyYear="2010",all_results=FALSE)
##D dat <- dhs_datasets(surveyYearStart="2006",all_results=FALSE)
##D dat <- dhs_datasets(surveyYearStart="1991", surveyYearEnd="2006",
##D all_results=FALSE)
##D dat <- dhs_datasets(surveyType="DHS",all_results=FALSE)
##D dat <- dhs_datasets(fileFormat="stata",all_results=FALSE)
##D dat <- dhs_datasets(fileFormat="DT",all_results=FALSE)
##D dat <- dhs_datasets(fileType="KR",all_results=FALSE)
##D dat <- dhs_datasets(f="geojson",all_results=FALSE)
## End(Not run)



