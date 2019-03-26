library(rnoaa)


### Name: ncdc_combine
### Title: Coerce multiple outputs to a single data.frame object.
### Aliases: ncdc_combine

### ** Examples

## Not run: 
##D # data
##D out1 <- ncdc(datasetid='GHCND', locationid = 'FIPS:02', startdate = '2010-05-01',
##D enddate = '2010-05-31', limit=10)
##D out2 <- ncdc(datasetid='GHCND', locationid = 'FIPS:02', startdate = '2010-07-01',
##D enddate = '2010-07-31', limit=10)
##D ncdc_combine(out1, out2)
##D 
##D # data sets
##D out1 <- ncdc_datasets(datatypeid='TOBS')
##D out2 <- ncdc_datasets(datatypeid='PRCP')
##D ncdc_combine(out1, out2)
##D 
##D # data types
##D out1 <- ncdc_datatypes(datatypeid="ACMH")
##D out2 <- ncdc_datatypes(datatypeid='PRCP')
##D ncdc_combine(out1, out2)
##D 
##D # data categories
##D out1 <- ncdc_datacats(datacategoryid="ANNAGR")
##D out2 <- ncdc_datacats(datacategoryid='PRCP')
##D ncdc_combine(out1, out2)
##D 
##D # data locations
##D out1 <- ncdc_locs(locationcategoryid='ST', limit=52)
##D out2 <- ncdc_locs(locationcategoryid='CITY', sortfield='name', sortorder='desc')
##D ncdc_combine(out1, out2)
##D 
##D # data locations
##D out1 <- ncdc_locs_cats(startdate='1970-01-01')
##D out2 <- ncdc_locs_cats(locationcategoryid='CLIM_REG')
##D ncdc_combine(out1, out2)
##D 
##D # stations
##D out1 <- ncdc_stations(datasetid='GHCND', locationid='FIPS:12017',
##D stationid='GHCND:USC00084289')
##D out2 <- ncdc_stations(stationid='COOP:010008')
##D out3 <- ncdc_stations(datasetid='PRECIP_HLY', startdate='19900101',
##D enddate='19901231')
##D out4 <- ncdc_stations(datasetid='GHCND', locationid='FIPS:12017')
##D ncdc_combine(out1, out2, out3, out4)
##D 
##D # try to combine two different classes
##D out1 <- ncdc_locs_cats(startdate='1970-01-01')
##D out2 <- ncdc_stations(stationid='COOP:010008')
##D out3 <- ncdc_locs_cats(locationcategoryid='CLIM_REG')
##D ncdc_combine(out1, out2, out3)
## End(Not run)



