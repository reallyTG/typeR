library(rnoaa)


### Name: ncdc_datatypes
### Title: Get possible data types for a particular dataset
### Aliases: ncdc_datatypes

### ** Examples

## Not run: 
##D # Fetch available data types
##D ncdc_datatypes()
##D 
##D # Fetch more information about the ACMH data type id, or the ACSC
##D ncdc_datatypes(datatypeid="ACMH")
##D ncdc_datatypes(datatypeid="ACSC")
##D 
##D # datasetid, one or many
##D ## ANNUAL should be replaced by GSOY, but both exist and give
##D ## different answers
##D ncdc_datatypes(datasetid="ANNUAL")
##D ncdc_datatypes(datasetid="GSOY")
##D ncdc_datatypes(datasetid=c("ANNUAL", "PRECIP_HLY"))
##D 
##D # Fetch data types with the air temperature data category
##D ncdc_datatypes(datacategoryid="TEMP", limit=56)
##D ncdc_datatypes(datacategoryid=c("TEMP", "AUPRCP"))
##D 
##D # Fetch data types that support a given set of stations
##D ncdc_datatypes(stationid='COOP:310090')
##D ncdc_datatypes(stationid=c('COOP:310090','COOP:310184','COOP:310212'))
##D 
##D # Fetch data types that support a given set of loncationids
##D ncdc_datatypes(locationid='CITY:AG000001')
##D ncdc_datatypes(locationid=c('CITY:AG000001','CITY:AG000004'))
## End(Not run)



