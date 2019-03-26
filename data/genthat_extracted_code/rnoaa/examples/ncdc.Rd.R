library(rnoaa)


### Name: ncdc
### Title: Search for and get NOAA NCDC data.
### Aliases: ncdc

### ** Examples

## Not run: 
##D # GHCN-Daily (or GHCND) data, for a specific station
##D ncdc(datasetid='GHCND', stationid='GHCND:USW00014895',
##D    startdate = '2013-10-01', enddate = '2013-12-01')
##D 
##D # GHCND data, for a location by FIPS code
##D ncdc(datasetid='GHCND', locationid = 'FIPS:02', startdate = '2010-05-01',
##D    enddate = '2010-05-10')
##D 
##D # GHCND data from October 1 2013 to December 1 2013
##D ncdc(datasetid='GHCND', startdate = '2013-10-01', enddate = '2013-10-05')
##D 
##D # GHCN-Monthly (or GSOM) data from October 1 2013 to December 1 2013
##D ncdc(datasetid='GSOM', startdate = '2013-10-01', enddate = '2013-12-01')
##D ncdc(datasetid='GSOM', startdate = '2013-10-01', enddate = '2013-12-01',
##D    stationid = "GHCND:AE000041196")
##D 
##D # Normals Daily (or NORMAL_DLY) GHCND:USW00014895 dly-tmax-normal data
##D ncdc(datasetid='NORMAL_DLY', stationid='GHCND:USW00014895',
##D    startdate = '2010-05-01', enddate = '2010-05-10')
##D 
##D # Dataset, and location in Australia
##D ncdc(datasetid='GHCND', locationid='FIPS:AS', startdate = '2010-05-01',
##D     enddate = '2010-05-31')
##D 
##D # Dataset, location and datatype for PRECIP_HLY data
##D ncdc(datasetid='PRECIP_HLY', locationid='ZIP:28801', datatypeid='HPCP',
##D    startdate = '2010-05-01', enddate = '2010-05-10')
##D 
##D # multiple datatypeid's
##D ncdc(datasetid='PRECIP_HLY', datatypeid=c('HPCP', 'ACMC'),
##D    startdate = '2010-05-01', enddate = '2010-05-10')
##D 
##D # multiple locationid's
##D ncdc(datasetid='PRECIP_HLY', locationid=c("FIPS:30103", "FIPS:30091"),
##D    startdate = '2010-05-01', enddate = '2010-05-10')
##D 
##D # Dataset, location, station and datatype
##D ncdc(datasetid='PRECIP_HLY', locationid='ZIP:28801',
##D    stationid='COOP:310301', datatypeid='HPCP',
##D    startdate = '2010-05-01', enddate = '2010-05-10')
##D 
##D # Dataset, location, and datatype for GHCND
##D ncdc(datasetid='GHCND', locationid='FIPS:BR', datatypeid='PRCP',
##D    startdate = '2010-05-01', enddate = '2010-05-10')
##D 
##D # Normals Daily GHCND dly-tmax-normal data
##D ncdc(datasetid='NORMAL_DLY', datatypeid='dly-tmax-normal',
##D    startdate = '2010-05-01', enddate = '2010-05-10')
##D 
##D # Normals Daily GHCND:USW00014895 dly-tmax-normal
##D ncdc(datasetid='NORMAL_DLY', stationid='GHCND:USW00014895',
##D    datatypeid='dly-tmax-normal',
##D    startdate = '2010-05-01', enddate = '2010-05-10')
##D 
##D # Hourly Precipitation data for ZIP code 28801
##D ncdc(datasetid='PRECIP_HLY', locationid='ZIP:28801', datatypeid='HPCP',
##D    startdate = '2010-05-01', enddate = '2010-05-10')
##D 
##D # 15 min Precipitation data for ZIP code 28801
##D ncdc(datasetid='PRECIP_15', datatypeid='QPCP',
##D    startdate = '2010-05-01', enddate = '2010-05-02')
##D 
##D # Search the NORMAL_HLY dataset
##D ncdc(datasetid='NORMAL_HLY', stationid = 'GHCND:USW00003812',
##D    startdate = '2010-05-01', enddate = '2010-05-10')
##D 
##D # Search the GSOY dataset
##D ncdc(datasetid='ANNUAL', locationid='ZIP:28801', startdate = '2010-05-01',
##D    enddate = '2010-05-10')
##D 
##D # Search the NORMAL_ANN dataset
##D ncdc(datasetid='NORMAL_ANN', datatypeid='ANN-DUTR-NORMAL',
##D    startdate = '2010-01-01', enddate = '2010-01-01')
##D 
##D # Include metadata or not
##D ncdc(datasetid='GHCND', stationid='GHCND:USW00014895',
##D    startdate = '2013-10-01', enddate = '2013-12-01')
##D ncdc(datasetid='GHCND', stationid='GHCND:USW00014895',
##D    startdate = '2013-10-01', enddate = '2013-12-01', includemetadata=FALSE)
##D 
##D # Many stationid's
##D stat <- ncdc_stations(startdate = "2000-01-01", enddate = "2016-01-01")
##D ## find out what datasets might be available for these stations
##D ncdc_datasets(stationid = stat$data$id[10])
##D ## get some data
##D ncdc(datasetid = "GSOY", stationid = stat$data$id[1:10],
##D    startdate = "2010-01-01", enddate = "2011-01-01")
## End(Not run)

## Not run: 
##D # NEXRAD2 data
##D ## doesn't work yet
##D ncdc(datasetid='NEXRAD2', startdate = '2013-10-01', enddate = '2013-12-01')
## End(Not run)



