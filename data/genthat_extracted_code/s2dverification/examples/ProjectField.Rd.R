library(s2dverification)


### Name: ProjectField
### Title: Project Anomalies onto Modes of Variability
### Aliases: ProjectField
### Keywords: datagen

### ** Examples

# See examples on Load() to understand the first lines in this example
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
##D                    leadtimemin = 1, leadtimemax = 4, output = 'lonlat',
##D                    latmin = 27, latmax = 48, lonmin = -12, lonmax = 40)
##D   
## End(Not run)
  ## Don't show: 
startDates <- c('19851101', '19901101', '19951101', '20001101', '20051101')
sampleData <- s2dverification:::.LoadSampleData('tos', c('experiment'),
                                                c('observation'), startDates,
                                                leadtimemin = 1,
                                                leadtimemax = 4,
                                                output = 'lonlat',
                                                latmin = 27, latmax = 48,
                                                lonmin = -12, lonmax = 40)
  
## End(Don't show)
# Now ready to compute the EOFs and project.
ano <- Ano_CrossValid(sampleData$mod, sampleData$obs)

# Compute the EOF of the observation.
eof <- EOF(ano$ano_obs[1, 1, , 1, , ], sampleData$lon, sampleData$lat)
# check the first mode represent the NAO
PlotEquiMap(eof$EOFs[1, , ], sampleData$lon, sampleData$lat, filled.continents = FALSE)

mode1_exp <- ProjectField(ano$ano_exp, eof, 1)
mode1_obs <- ProjectField(ano$ano_obs, eof, 1)

# Plot the forecast and the observation of the first mode
# for the last year of forecast
plot(mode1_obs[1, 1, dim(sampleData$mod)[3], ], type = "l", ylim = c(-1, 1), lwd = 2)
for (i in 1:dim(sampleData$mod)[2]) {
  par(new = TRUE)
  plot(mode1_exp[1, i, dim(sampleData$mod)[3], ], type = "l", col = rainbow(10)[i], 
       ylim = c(-15000, 15000))
}



