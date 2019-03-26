library(rnoaa)


### Name: ncdc_datacats
### Title: Get possible data categories for a particular datasetid,
###   locationid, stationid, etc.
### Aliases: ncdc_datacats

### ** Examples

## Not run: 
##D ## Limit to 10 results
##D ncdc_datacats(limit=10)
##D 
##D ## by datasetid
##D ncdc_datacats(datasetid="ANNUAL")
##D ncdc_datacats(datasetid=c("ANNUAL", "PRECIP_HLY"))
##D 
##D ## Single data category
##D ncdc_datacats(datacategoryid="ANNAGR")
##D 
##D ## Fetch data categories for a given set of locations
##D ncdc_datacats(locationid='CITY:US390029')
##D ncdc_datacats(locationid=c('CITY:US390029', 'FIPS:37'))
##D 
##D ## Data categories for a given date
##D ncdc_datacats(startdate = '2013-10-01')
##D 
##D # Get data categories with data for a series of the same parameter arg, in this case
##D # stationid's
##D ncdc_datacats(stationid='COOP:310090')
##D ncdc_datacats(stationid=c('COOP:310090','COOP:310184','COOP:310212'))
##D 
##D ## Curl debugging
##D ncdc_datacats(limit=10, config=verbose())
##D out <- ncdc_datacats(limit=10, config=progress())
## End(Not run)



