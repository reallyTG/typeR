library(s2dverification)


### Name: PlotBoxWhisker
### Title: Box-And-Whisker Plot of Time Series with Ensemble Distribution
### Aliases: PlotBoxWhisker
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
                                                latmin = 20, latmax = 80,
                                                lonmin = -80, lonmax = 40)
# No example data is available over NAO region, so in this example we will 
# tweak the available data. In a real use case, one can Load() the data over 
# NAO region directly.
sampleData$lon[] <- c(40, 280, 340)
attr(sampleData$lon, 'first_lon') <- 280
attr(sampleData$lon, 'last_lon') <- 40
attr(sampleData$lon, 'data_across_gw') <- TRUE
sampleData$lat[] <- c(20, 80)
attr(sampleData$lat, 'first_lat') <- 20
attr(sampleData$lat, 'last_lat') <- 80
  
## End(Don't show)
# Now ready to compute the EOFs and project on, for example, the first 
# variability mode.
ano <- Ano_CrossValid(sampleData$mod, sampleData$obs)
nao <- NAO(ano$ano_exp, ano$ano_obs, sampleData$lon, sampleData$lat)
# Finally plot the nao index
PlotBoxWhisker(nao$NAO_exp, nao$NAO_obs, "NAO index, DJF", "NAO index (PC1) TOS", 
               monini = 12, yearini = 1985, freq = 1, "Exp. A", "Obs. X")



