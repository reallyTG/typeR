library(hydroscoper)


### Name: get_tables
### Title: Get tibbles from Hydroscope
### Aliases: get_tables get_stations get_timeseries get_instruments
###   get_water_basins get_water_divisions get_political_divisions
###   get_variables get_units_of_measurement get_time_steps get_owners
###   get_instruments_type get_station_type get_database

### ** Examples


## Not run: 
##D 
##D # data will be downloaded from Ministry of Environment and Energy (kyy):
##D subdomain <- "kyy"
##D 
##D # stations
##D kyy_stations <- get_stations(subdomain)
##D 
##D # time series
##D kyy_ts <- get_timeseries(subdomain)
##D 
##D # instruments
##D kyy_inst <- get_instruments(subdomain)
##D 
##D # water basins
##D kyy_wbas <- get_water_basins(subdomain)
##D 
##D # water divisions
##D kyy_wdiv <- get_water_divisions(subdomain)
##D 
##D # political divisions
##D kyy_pol <- get_political_divisions(subdomain)
##D 
##D # variables
##D kyy_vars <- get_variables(subdomain)
##D 
##D # units of measurement
##D kyy_units <- get_units_of_measurement(subdomain)
##D 
##D # time steps
##D kyy_time_steps <- get_time_steps(subdomain)
##D 
##D # owners
##D kyy_owners <- get_owners(subdomain)
##D 
##D # instruments type
##D kyy_instr_type <- get_instruments_type(subdomain)
##D 
##D # stations' type
##D kyy_st_type <- get_station_type(subdomain)
##D 
##D # use all the get_ functions above to create a named list with tibbles
##D kyy_db <- get_database(subdomain)
##D 
## End(Not run)




