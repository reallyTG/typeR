library(efts)


### Name: open_efts
### Title: Creates a EftsDataSet for access to a netCDF EFTS data set
### Aliases: open_efts

### ** Examples

library(efts)
ext_data <- system.file('extdata', package='efts')
ens_fcast_file <- file.path(ext_data, 'Upper_Murray_sample_ensemble_rain_fcast.nc')
stopifnot(file.exists(ens_fcast_file))
snc <- open_efts(ens_fcast_file)
(variable_names <- snc$get_variable_names())
(stations_ids <- snc$get_values('station_id'))
nEns <- snc$get_ensemble_size()
nLead <- snc$get_lead_time_count()
td <- snc$get_time_dim()
stopifnot('rain_fcast_ens' %in% variable_names)

ens_fcast_rainfall <- snc$get_ensemble_forecasts('rain_fcast_ens',
  stations_ids[1], start_time=td[2])
names(ens_fcast_rainfall) <- as.character(1:ncol(ens_fcast_rainfall))
plot(ens_fcast_rainfall, legend.loc='right')

snc$close()




