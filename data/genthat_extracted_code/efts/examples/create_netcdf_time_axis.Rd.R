library(efts)


### Name: create_netcdf_time_axis
### Title: Create a time axis unit known to work for netCDF
### Aliases: create_netcdf_time_axis

### ** Examples

start_time <- ISOdate(year=2010, month=08, day=01, hour = 12, min = 0, sec = 0, tz = 'UTC')
create_netcdf_time_axis(d=start_time)
start_time <- ISOdate(year=2015, month=10, day=04, hour = 01, 
  min = 0, sec = 0, tz = 'Australia/Sydney')
create_netcdf_time_axis(d=start_time, tzoffset='+1000')




