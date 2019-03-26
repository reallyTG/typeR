library(tidyqwi)


### Name: check_census_api_call
### Title: A helper function to help parse API calls from the census
### Aliases: check_census_api_call

### ** Examples

## No test: 
library(tidyqwi)
library(httr)
# A single call to the API without an API Key
url <- "api.census.gov/data/timeseries/qwi/sa?get=Emp&for=county:198&key=NOKEY"
single_call <- httr::GET(url)

# Because a non valid API key was specified an message will be returned

check_census_api_call(single_call)

## End(No test)




