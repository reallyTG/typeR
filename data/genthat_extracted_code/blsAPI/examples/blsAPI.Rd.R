library(blsAPI)


### Name: blsAPI
### Title: Request Data from the U.S. Bureau Of Labor Statistics API
### Aliases: blsAPI
### Keywords: api bls economics

### ** Examples

# These examples are taken from <https://www.bls.gov/developers/api_signature.htm>
library(rjson)
library(blsAPI)

# API Version 1.0 R Script Sample Code
# Single Series request
response <- blsAPI('LAUCN040010000000005')
json <- fromJSON(response)
## Not run: 
##D # Multiple Series
##D payload <- list('seriesid'=c('LAUCN040010000000005','LAUCN040010000000006'))
##D response <- blsAPI(payload)
##D json <- fromJSON(response)
##D 
##D # One or More Series, Specifying Years
##D payload <- list(
##D  'seriesid'=c('LAUCN040010000000005','LAUCN040010000000006'),
##D  'startyear'=2010,
##D  'endyear'=2012)
##D response <- blsAPI(payload)
##D json <- fromJSON(response)
##D 
##D # API Version 2.0 R Script Sample Code
##D # Single Series
##D response <- blsAPI('LAUCN040010000000005', 2)
##D json <- fromJSON(response)
##D # Or request a data frame
##D df <- blsAPI('LAUCN040010000000005', 2, TRUE)
##D 
##D # Multiple Series
##D payload <- list('seriesid'=c('LAUCN040010000000005','LAUCN040010000000006'))
##D response <- blsAPI(payload, 2)
##D json <- fromJSON(response)
##D 
##D # One or More Series with Optional Parameters
##D payload <- list(
##D   'seriesid'=c('LAUCN040010000000005','LAUCN040010000000006'),
##D   'startyear'=2010,
##D   'endyear'=2012,
##D   'catalog'=FALSE,
##D   'calculations'=TRUE,
##D   'annualaverage'=TRUE,
##D   'registrationKey'='995f4e779f204473aa565256e8afe73e')
##D response <- blsAPI(payload, 2)
##D json <- fromJSON(response)
## End(Not run)



