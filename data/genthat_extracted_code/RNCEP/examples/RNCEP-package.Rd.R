library(RNCEP)


### Name: RNCEP-package
### Title: This package of functions retrieves, organizes, and visualizes
###   weather data from either the NCEP/NCAR Reanalysis or NCEP/DOE
###   Reanalysis II datasets
### Aliases: RNCEP-package RNCEP
### Keywords: package

### ** Examples

## Not run: 
##D library(RNCEP)
##D ## Retrieve the temperature from a particular pressure level for
##D ## a specified spatial and temporal extent
##D wx.extent <- NCEP.gather(variable='air', level=850,
##D     months.minmax=c(8,9), years.minmax=c(2000,2001),
##D     lat.southnorth=c(50,55), lon.westeast=c(0,5),
##D     reanalysis2 = FALSE, return.units = TRUE)
##D 
##D ## Retrive the temperature from a particular pressure level
##D ## interpolated in space and time
##D wx.interp <- NCEP.interp(variable='air', level=850, lat=55.1,
##D     lon=11.3, dt='2006-10-12 17:23:12')
##D 
##D ## Simulate a flight trajectory using NCEP wind data
##D flight <- NCEP.flight(beg.loc=c(58.00,7.00), 
##D   end.loc=c(53.00,7.00), begin.dt='2007-10-01 18:00:00',
##D   flow.assist='NCEP.Tailwind', fa.args=list(airspeed=12),
##D   path='loxodrome', calibrate.dir=FALSE, calibrate.alt=FALSE,
##D   cutoff=0, when2stop='latitude', levels2consider=c(850,925),
##D   hours=12, evaluation.interval=60, id=1, land.if.bad=FALSE,
##D   reanalysis2 = FALSE, query=TRUE)
## End(Not run)



