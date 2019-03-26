library(rnoaa)


### Name: ncdc_plot
### Title: Plot NOAA climate data.
### Aliases: ncdc_plot

### ** Examples

## Not run: 
##D # Search for data first, then plot
##D out <- ncdc(datasetid='GHCND', stationid='GHCND:USW00014895', datatypeid='PRCP',
##D    startdate = '2010-05-01', enddate = '2010-10-31', limit=500)
##D ncdc_plot(out)
##D ncdc_plot(out, breaks="14 days")
##D ncdc_plot(out, breaks="1 month", dateformat="%d/%m")
##D ncdc_plot(out, breaks="1 month", dateformat="%d/%m")
##D 
##D # Combine many calls to ncdc function
##D out1 <- ncdc(datasetid='GHCND', stationid='GHCND:USW00014895', datatypeid='PRCP',
##D    startdate = '2010-03-01', enddate = '2010-05-31', limit=500)
##D out2 <- ncdc(datasetid='GHCND', stationid='GHCND:USW00014895', datatypeid='PRCP',
##D    startdate = '2010-09-01', enddate = '2010-10-31', limit=500)
##D df <- ncdc_combine(out1, out2)
##D ncdc_plot(df)
##D ## or pass in each element separately
##D ncdc_plot(out1, out2, breaks="45 days")
## End(Not run)



