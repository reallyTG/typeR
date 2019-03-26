library(s2dverification)


### Name: AnimateMap
### Title: Animate Maps of Forecast/Observed Values or Scores Over Forecast
###   Time
### Aliases: AnimateMap
### Keywords: dynamic

### ** Examples

# See ?Load for explanations on the first part of this example
  ## Not run: 
##D data_path <- system.file('sample_data', package = 's2dverification')
##D expA <- list(name = 'experiment', path = file.path(data_path,
##D              'model/$EXP_NAME$/$STORE_FREQ$_mean/$VAR_NAME$_3hourly',
##D              '$VAR_NAME$_$START_DATE$.nc'))
##D obsX <- list(name = 'observation', path = file.path(data_path,
##D              '$OBS_NAME$/$STORE_FREQ$_mean/$VAR_NAME$',
##D              '$VAR_NAME$_$YEAR$$MONTH$.nc'))
##D 
##D # Now we are ready to use Load().
##D startDates <- c('19851101', '19901101', '19951101', '20001101', '20051101')
##D sampleData <- Load('tos', list(expA), list(obsX), startDates,
##D                    output = 'lonlat', latmin = 27, latmax = 48, 
##D                    lonmin = -12, lonmax = 40)
##D   
## End(Not run)
  ## Don't show: 
startDates <- c('19851101', '19901101', '19951101', '20001101', '20051101')
sampleData <- s2dverification:::.LoadSampleData('tos', c('experiment'),
                                                c('observation'), startDates,
                                                output = 'lonlat',
                                                latmin = 27, latmax = 48,
                                                lonmin = -12, lonmax = 40)
  
## End(Don't show)
clim <- Clim(sampleData$mod, sampleData$obs, memb = FALSE)
  ## Not run: 
##D AnimateMap(clim$clim_exp, sampleData$lon, sampleData$lat,
##D   toptitle = "climatology of decadal prediction", sizetit = 1, 
##D   units = "degree", brks = seq(270, 300, 3), monini = 11, freq = 12, 
##D   msk95lev = FALSE, filled.continents = TRUE, intlon = 10, intlat = 10,
##D   fileout = 'clim_dec.gif')
##D   
## End(Not run)
ano_exp <- Ano(sampleData$mod, clim$clim_exp)
ano_obs <- Ano(sampleData$obs, clim$clim_obs)
leadtimes_dimension <- 4
initial_month <- 11
mean_start_month <- 1
mean_stop_month <- 12
season_means_mod <- Season(ano_exp, leadtimes_dimension, initial_month,
                           mean_start_month, mean_stop_month)
season_means_obs <- Season(ano_obs, leadtimes_dimension, initial_month,
                           mean_start_month, mean_stop_month)
  ## Not run: 
##D AnimateMap(Mean1Dim(season_means_mod, 2)[1, 1, , , ], sampleData$lon,
##D   sampleData$lat, toptitle = "Annual anomalies 1985 of decadal prediction",
##D   sizetit = 1, units = "degree", monini = 1, freq = 1, msk95lev = FALSE,
##D   brks = seq(-0.5, 0.5, 0.1), intlon = 10, intlat = 10,
##D   filled.continents = TRUE, fileout = 'annual_means_dec.gif')
##D   
## End(Not run)
dim_to_mean <- 2  # Mean along members
rms <- RMS(Mean1Dim(season_means_mod, dim_to_mean),
           Mean1Dim(season_means_obs, dim_to_mean))
AnimateMap(rms, sampleData$lon, sampleData$lat, toptitle =
  "RMSE decadal prediction", sizetit = 1, units = "degree",
  monini = 1, freq = 1, msk95lev = FALSE, brks = seq(0, 0.8, 0.08),
  intlon = 10, intlat = 10, filled.continents = TRUE,
  fileout = 'rmse_dec.gif')



