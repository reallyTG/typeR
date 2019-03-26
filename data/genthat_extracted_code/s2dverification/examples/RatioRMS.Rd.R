library(s2dverification)


### Name: RatioRMS
### Title: Computes the Ratio Between The RMSE of Two Experiments
### Aliases: RatioRMS .RatioRMS
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
# Compute DJF seasonal means and anomalies.
leadtimes_dimension <- 4
initial_month <- 11
mean_start_month <- 12
mean_stop_month <- 2                                
sampleData$mod <- Season(sampleData$mod, leadtimes_dimension, initial_month, 
                         mean_start_month, mean_stop_month)
sampleData$obs <- Season(sampleData$obs, leadtimes_dimension, initial_month, 
                         mean_start_month, mean_stop_month)                              
clim <- Clim(sampleData$mod, sampleData$obs)
ano_exp <- Ano(sampleData$mod, clim$clim_exp)
ano_obs <- Ano(sampleData$obs, clim$clim_obs)
# Generate two experiments with 2 and 1 members from the only experiment 
# available in the sample data. Take only data values for a single forecast
# time step.
ano_exp_1 <- Subset(ano_exp, 'member', c(1, 2))
ano_exp_2 <- Subset(ano_exp, 'member', c(3))
ano_exp_1 <- Subset(ano_exp_1, c('dataset', 'ftime'), list(1, 1), drop = 'selected')
ano_exp_2 <- Subset(ano_exp_2, c('dataset', 'ftime'), list(1, 1), drop = 'selected')
ano_obs <- Subset(ano_obs, c('dataset', 'ftime'), list(1, 1), drop = 'selected')
# Compute ensemble mean and provide as inputs to RatioRMS.
rrms <- RatioRMS(Mean1Dim(ano_exp_1, 1), 
                 Mean1Dim(ano_exp_2, 1), 
                 Mean1Dim(ano_obs, 1))
# Plot the RatioRMS for the first forecast time step.
PlotEquiMap(rrms[1, , ], sampleData$lon, sampleData$lat, 
            toptitle = 'Ratio RMSE')

# The following example uses veriApply combined with .RatioRMS instead of RatioRMS
  ## Not run: 
##D require(easyVerification)
##D # The name of the function has to end in 'ss' in order for veriApply() to 
##D # detect it as a skill score.
##D RatioRMSss <- s2dverification:::.RatioRMS
##D rrms2 <- veriApply("RatioRMSss", ano_exp_1,
##D                    # see ?veriApply for how to use the 'parallel' option
##D                    Mean1Dim(ano_obs, 1),
##D                    ano_exp_2,
##D                    tdim = 2, ensdim = 1)
##D   
## End(Not run)



