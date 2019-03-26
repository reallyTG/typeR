library(rnoaa)


### Name: coops
### Title: Get NOAA co-ops data
### Aliases: coops coops_search

### ** Examples

## Not run: 
##D # Get monthly mean sea level data at Vaca Key (8723970)
##D coops_search(station_name = 8723970, begin_date = 20120301,
##D   end_date = 20141001, datum = "stnd", product = "monthly_mean")
##D 
##D # Get verified water level data at Vaca Key (8723970)
##D coops_search(station_name = 8723970, begin_date = 20140927,
##D   end_date = 20140928, datum = "stnd", product = "water_level")
##D 
##D # Get daily mean water level data at Fairport, OH (9063053)
##D coops_search(station_name = 9063053, begin_date = 20150927,
##D   end_date = 20150928, product = "daily_mean", datum = "stnd",
##D   time_zone = "lst")
##D 
##D # Get air temperature at Vaca Key (8723970)
##D coops_search(station_name = 8723970, begin_date = 20140927,
##D   end_date = 20140928, product = "air_temperature")
##D 
##D # Get water temperature at Vaca Key (8723970)
##D coops_search(station_name = 8723970, begin_date = 20140927,
##D   end_date = 20140928, product = "water_temperature")
##D 
##D # Get air pressure at Vaca Key (8723970)
##D coops_search(station_name = 8723970, begin_date = 20140927,
##D   end_date = 20140928, product = "air_pressure")
##D 
##D # Get wind at Vaca Key (8723970)
##D coops_search(station_name = 8723970, begin_date = 20140927,
##D   end_date = 20140928, product = "wind")
##D 
##D # Get hourly water level height at Key West (8724580)
##D coops_search(station_name = 8724580, begin_date = 20140927,
##D   end_date = 20140928, product = "hourly_height", datum = "stnd")
##D 
##D # Get high-low water level at Key West (8724580)
##D coops_search(station_name = 8724580, begin_date = 20140927,
##D   end_date = 20140928, product = "high_low", datum = "stnd")
##D 
##D # Get currents data at Pascagoula Harbor (ps0401)
##D coops_search(station_name = "ps0401", begin_date = 20151221,
##D   end_date = 20151222, product = "currents")
##D 
##D # Get one-minute water level at Vaca Key (8723970)
##D coops_search(station_name = 8723970, begin_date = 20140927,
##D   end_date = 20140928, datum = "stnd", product = "one_minute_water_level")
##D 
##D # Get datums at Fort Myers, FL (8725520)
##D coops_search(station_name = 8725520, product = "datums")
##D 
##D # Get water level predictions at Vaca Key (8723970)
##D coops_search(station_name = 8723970, begin_date = 20140928,
##D   end_date = 20140929, datum = "stnd", product = "predictions")
##D 
## End(Not run)



