library(rnoaa)


### Name: ncdc_stations
### Title: Get metadata about NOAA NCDC stations.
### Aliases: ncdc_stations

### ** Examples

## Not run: 
##D # Get metadata on all stations
##D ncdc_stations()
##D ncdc_stations(limit=5)
##D 
##D # Get metadata on a single station
##D ncdc_stations(stationid='COOP:010008')
##D 
##D # For many stations use lapply or similar
##D lapply(c("COOP:010008", "COOP:010063", "COOP:010116"), function(z) {
##D   ncdc_stations(
##D    startdate = "2013-01-01",
##D    enddate = "2014-11-01",
##D    stationid = z)
##D }$data)
##D 
##D # Displays all stations within GHCN-Daily (100 Stations per page limit)
##D ncdc_stations(datasetid = 'GHCND')
##D ncdc_stations(datasetid = 'ANNUAL')
##D ncdc_stations(datasetid = 'GSOY')
##D 
##D # Station
##D ncdc_stations(datasetid='NORMAL_DLY', stationid='GHCND:USW00014895')
##D 
##D # datatypeid
##D ncdc_stations(datatypeid="ANN-HTDD-NORMAL")
##D ncdc_stations(datatypeid=c("ANN-HTDD-NORMAL", "ACSC"))
##D 
##D # locationid
##D ncdc_stations(locationid="CITY:AG000001")
##D ncdc_stations(locationid="FIPS:30091")
##D ncdc_stations(locationid=c("FIPS:30103", "FIPS:30091"))
##D 
##D # datacategoryid
##D ncdc_stations(datacategoryid="ANNPRCP")
##D ncdc_stations(datacategoryid="AUAGR")
##D ncdc_stations(datacategoryid=c("ANNPRCP", "AUAGR"))
##D 
##D # Displays all stations within GHCN-Daily (Displaying page 10 of the results)
##D ncdc_stations(datasetid='GHCND')
##D 
##D # Specify datasetid and locationid
##D ncdc_stations(datasetid='GHCND', locationid='FIPS:12017')
##D 
##D # Specify datasetid, locationid, and station
##D ncdc_stations(datasetid='GHCND', locationid='FIPS:12017', stationid='GHCND:USC00084289')
##D 
##D # Specify datasetid, locationidtype, locationid, and station
##D ncdc_stations(datasetid='GHCND', locationid='FIPS:12017', stationid='GHCND:USC00084289')
##D 
##D # Displays list of stations within the specified county
##D ncdc_stations(datasetid='GHCND', locationid='FIPS:12017')
##D 
##D # Displays list of Hourly Precipitation locationids between 01/01/1990 and 12/31/1990
##D ncdc_stations(datasetid='PRECIP_HLY', startdate='19900101', enddate='19901231')
##D 
##D # Search for stations by spatial extent
##D ## Search using a bounding box, w/ lat/long of the SW corner, then of NE corner
##D ncdc_stations(extent=c(47.5204,-122.2047,47.6139,-122.1065))
## End(Not run)



