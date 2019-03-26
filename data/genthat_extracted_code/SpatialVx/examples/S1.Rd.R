library(SpatialVx)


### Name: S1
### Title: S1 Score, Anomaly Correlation
### Aliases: S1 S1.default S1.SpatialVx ACC ACC.default ACC.SpatialVx
### Keywords: math

### ** Examples

data( "UKobs6" )
data( "UKfcst6" )

S1( UKobs6, xhat = UKfcst6 )
ACC( UKobs6, xhat = UKfcst6 )

## Not run: 
##D data( "obs0426" )
##D data( "wrf4ncar0425" )
##D data( "ICPg240Locs" )
##D 
##D hold <- make.SpatialVx( obs0426, wrf4ncar0425, loc = ICPg240Locs,
##D     projection = TRUE, map = TRUE, loc.byrow = TRUE,
##D     field.type = "Precipitation", units = "mm/h",
##D     data.name = "ICP NSSL/SPC Spring 2005 Cases",
##D     obs.name = "obs0426", model.name = "wrf4ncar0425" )
##D 
##D plot( hold )
##D 
##D S1( hold )
##D ACC( hold )
## End(Not run)



