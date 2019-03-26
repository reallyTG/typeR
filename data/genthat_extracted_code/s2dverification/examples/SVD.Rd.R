library(s2dverification)


### Name: SVD
### Title: Single Value Decomposition (Maximum Covariance Analysis)
### Aliases: SVD
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
# This example computes the ECs and MCAs along forecast horizons and plots the 
# one that explains the greatest amount of variability. The example data is 
# very low resolution so it does not make a lot of sense.
ano <- Ano_CrossValid(sampleData$mod, sampleData$obs)
mca <- SVD(Mean1Dim(ano$ano_exp, 2)[1, , 1, , ], 
           Mean1Dim(ano$ano_obs, 2)[1, , 1, , ], 
           sampleData$lat, sampleData$lat)
PlotEquiMap(mca$MCAs_U[1, , ], sampleData$lon, sampleData$lat)
plot(mca$ECs_U[1, ])
PlotEquiMap(mca$MCAs_V[1, , ], sampleData$lon, sampleData$lat)
plot(mca$ECs_V[1, ])



