library(rdhs)


### Name: dhs_geometry
### Title: API request of DHS Geometry
### Aliases: dhs_geometry

### ** Examples


## Not run: 
##D # The geometry API endpoint returns the spatial geometry for countries, and
##D # can then be used to recreate the spatial polygon for a given country. For
##D # example to return the coordinates for the Senegal 2010 DHS survey:
##D 
##D dat <- dhs_geometry(surveyIds="SN2010DHS")
##D 
##D # At the moment there is no function to convert the coordinates returned by
##D # the API but this will be in the next version of rdhs. For those interested
##D # look at the geojson vignette for an alternative way to produce plots.
##D 
##D # A complete list of examples for how each argument to the geometry
##D # API endpoint can be provided is given below, which is a
##D # copy of each of the examples listed in the API at:
##D 
##D # https://api.dhsprogram.com/#/api-geometry.cfm
##D 
##D 
##D dat <- dhs_geometry(countryIds="EG",all_results=FALSE)
##D dat <- dhs_geometry(surveyIds="SN2010DHS",all_results=FALSE)
##D dat <- dhs_geometry(surveyYear="2010",all_results=FALSE)
##D dat <- dhs_geometry(surveyYearStart="2006",all_results=FALSE)
##D dat <- dhs_geometry(surveyYearStart="1991", surveyYearEnd="2006",
##D all_results=FALSE)
##D dat <- dhs_geometry(surveyType="DHS",all_results=FALSE)
##D dat <- dhs_geometry(f="geojson",all_results=FALSE)
## End(Not run)



