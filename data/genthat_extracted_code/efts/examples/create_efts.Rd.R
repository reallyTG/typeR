library(efts)


### Name: create_efts
### Title: Creates a EftsDataSet for write access to a netCDF EFTS data set
### Aliases: create_efts

### ** Examples


# NOTE
# The sample code below is purposely generic; to produce 
# a data set conforming with the conventions devised for 
# ensemble streamflow forecast you will need to 
# follow the additional guidelines at 
# https://github.com/jmp75/efts/blob/master/docs/netcdf_for_water_forecasting.md

fname <- tempfile()

stations_ids <- c(123,456)
nEns <- 3
nLead <- 4
nTimeSteps <- 12

timeAxisStart <- ISOdate(year=2010, month=08, day=01, hour = 14, min = 0, sec = 0, tz = 'UTC')
time_dim_info <- create_time_info(from=timeAxisStart, 
  n=nTimeSteps, time_step = "hours since")

# It is possible to define variables for three combinations of dimensions.
# dimensions '4' ==> [lead_time,station,ens_member,time]
# dimensions '3' ==> [station,ens_member,time]   
# dimensions '2' ==> [station,time]   

variable_names <- c('var1_fcast_ens','var2_fcast_ens', 'var1_obs', 
  'var2_obs', 'var1_ens','var2_ens')

va <- create_var_attribute_definition(
  type = 2L, 
  type_description = "accumulated over the preceding interval", 
  dat_type = "der", 
  dat_type_description = paste(rep(c("var1", "var2"), 3), "synthetic test data"),
  location_type = "Point")


(varDef <- create_variable_definition_dataframe(
  variable_names=variable_names, 
  long_names = paste(variable_names, 'synthetic data'), 
  dimensions = c(4L,4L,2L,2L,3L,3L),
  var_attributes = va))

glob_attr <- create_global_attributes(
  title="data set title", 
  institution="my org", 
  catchment="Upper_Murray", 
  source="A journal reference, URL", 
  comment="example for vignette")

(opt_metadatavars <- default_optional_variable_definitions_v2_0())

snc <- create_efts(
  fname=fname, 
  time_dim_info=time_dim_info, 
  data_var_definitions=varDef, 
  stations_ids=stations_ids, 
  nc_attributes=glob_attr, 
  optional_vars = opt_metadatavars, 
  lead_length=nLead, 
  ensemble_length=nEns,
  lead_time_tstep = "hours")

# Following is code that was used to create unit tests for EFTS.
# This is kept in this example to provide sample on now to write data of various dimension.
td <- snc$get_time_dim()
m <- matrix(ncol=nEns, nrow=nLead)
for (rnum in 1:nLead) {
    for (cnum in 1:nEns) {
      m[rnum,cnum] = rnum*0.01 + cnum*0.1
  }
}
#      [,1] [,2] [,3]
# [1,] 0.11 0.21 0.31
# [2,] 0.12 0.22 0.32
# [3,] 0.13 0.23 0.33
# [4,] 0.14 0.24 0.34
for (i in 1:length(td)) {
  for (j in 1:length(stations_ids)) {
    station <- stations_ids[j]
    var1Values <- i + 0.1*j + m
    var2Values <- 2*var1Values
    dtime = td[i]
    snc$put_ensemble_forecasts(var1Values, variable_name = variable_names[1], 
      identifier = station, start_time = dtime)
    snc$put_ensemble_forecasts(var2Values, variable_name = variable_names[2], 
      identifier = station, start_time = dtime)
  }
}

timeSteps <- 1:length(td)
for (j in 1:length(stations_ids)) {
  var3Values <- timeSteps + 0.1*j
  var4Values <- var3Values + 0.01*timeSteps + 0.001*j

  station <- stations_ids[j]
  snc$put_single_series(var3Values, variable_name = variable_names[3], identifier = station)
  snc$put_single_series(var4Values, variable_name = variable_names[4], identifier = station)
}

for (j in 1:length(stations_ids)) {

  var5Xts <- matrix(rep(1:nEns, each=nTimeSteps) + timeSteps + 0.1*j, ncol=nEns)

  # [time,ens_member] to [ens_member,time], as expected by put_ensemble_series
  var5Values <- t(var5Xts) 
  var6Values <- 0.25 * var5Values

  station <- stations_ids[j]
  snc$put_ensemble_series(var5Values, variable_name = variable_names[5], identifier = station)
  snc$put_ensemble_series(var6Values, variable_name = variable_names[6], identifier = station)
}

# We can get/put values for some metadata variables:
snc$get_values("x")
snc$put_values(c(1.1, 2.2), "x")
snc$put_values(letters[1:2], "station_name")

# Direct get/set access to data variables, however, is prevented;
#  the following would thus cause an error:
# snc$get_values("var1_fcast_ens")

snc$close()
# Cleaning up temp file:
if (file.exists(fname)) 
  file.remove(fname)

 




