library(rnoaa)


### Name: ncdc_datasets
### Title: Search NOAA datasets
### Aliases: ncdc_datasets

### ** Examples

## Not run: 
##D # Get a table of all datasets
##D ncdc_datasets()
##D 
##D # Get details from a particular dataset
##D ncdc_datasets(datasetid='ANNUAL')
##D 
##D # Get datasets with Temperature at the time of observation (TOBS) data type
##D ncdc_datasets(datatypeid='TOBS')
##D ## two datatypeid's
##D ncdc_datasets(datatypeid=c('TOBS', "ACMH"))
##D 
##D # Get datasets with data for a series of the same parameter arg, in this case
##D # stationid's
##D ncdc_datasets(stationid='COOP:310090')
##D ncdc_datasets(stationid=c('COOP:310090','COOP:310184','COOP:310212'))
##D 
##D # Multiple datatypeid's
##D ncdc_datasets(datatypeid=c('ACMC','ACMH','ACSC'))
##D ncdc_datasets(datasetid='ANNUAL', datatypeid=c('ACMC','ACMH','ACSC'))
##D ncdc_datasets(datasetid='GSOY', datatypeid=c('ACMC','ACMH','ACSC'))
##D 
##D # Multiple locationid's
##D ncdc_datasets(locationid="FIPS:30091")
##D ncdc_datasets(locationid=c("FIPS:30103", "FIPS:30091"))
## End(Not run)



