library(RNCEP)


### Name: NCEP.bind
### Title: Bind Two 3-D Arrays of Weather Data Along the Prime Meridian
### Aliases: NCEP.bind

### ** Examples

## Not run: 
##D library(RNCEP)
##D ## Using NCEP.gather(), query weather data from both sides of
##D ## the Prime Meridian ##
##D ## NCEP.bind() is applied automatically ##
##D wx <- NCEP.gather(variable='air', level=925,
##D     months.minmax=10, years.minmax=2003,
##D     lat.southnorth=c(50, 52.5), lon.westeast=c(-2.5, 2.5),
##D     reanalysis2=FALSE, return.units=TRUE)
## End(Not run)



