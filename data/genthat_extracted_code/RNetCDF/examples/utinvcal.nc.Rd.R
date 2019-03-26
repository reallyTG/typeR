library(RNetCDF)


### Name: utinvcal.nc
### Title: Convert UTC Referenced Dates Into Temporal Amounts
### Aliases: utinvcal.nc
### Keywords: utilities

### ** Examples

##  Convert UTC referenced time to other time units
utinvcal.nc("hours since 1900-01-01 00:00:00 +01:00", c(1900,1,1,5,25,0))
utinvcal.nc("hours since 1900-01-01 00:00:00 +01:00", "1900-01-01 05:25:00")
utinvcal.nc("hours since 1900-01-01 00:00:00 +01:00", ISOdatetime(1900,1,1,5,25,0,tz="UTC"))

##  An example of reading and writing a netcdf time coordinate 
##  is given in the help for utcal.nc



