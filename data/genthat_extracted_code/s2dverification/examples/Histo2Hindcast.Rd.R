library(s2dverification)


### Name: Histo2Hindcast
### Title: Chunks Long Simulations For Comparison With Hindcasts
### Aliases: Histo2Hindcast
### Keywords: datagen

### ** Examples

# See examples on Load() to understand the first lines in this example
  ## Not run: 
##D configfile <- paste0(tempdir(), '/sample.conf')
##D ConfigFileCreate(configfile, confirm = FALSE)
##D c <- ConfigFileOpen(configfile)
##D c <- ConfigEditDefinition(c, 'DEFAULT_VAR_MIN', '-1e19', confirm = FALSE)
##D c <- ConfigEditDefinition(c, 'DEFAULT_VAR_MAX', '1e19', confirm = FALSE)
##D data_path <- system.file('sample_data', package = 's2dverification')
##D exp_data_path <- paste0(data_path, '/model/$EXP_NAME$/')
##D obs_data_path <- paste0(data_path, '/$OBS_NAME$/')
##D c <- ConfigAddEntry(c, 'experiments', dataset_name = 'experiment', 
##D      var_name = 'tos', main_path = exp_data_path,
##D      file_path = '$STORE_FREQ$_mean/$VAR_NAME$_3hourly/$VAR_NAME$_$START_DATE$.nc')
##D c <- ConfigAddEntry(c, 'observations', dataset_name = 'observation', 
##D      var_name = 'tos', main_path = obs_data_path,
##D      file_path = '$STORE_FREQ$_mean/$VAR_NAME$/$VAR_NAME$_$YEAR$$MONTH$.nc')
##D ConfigFileSave(c, configfile, confirm = FALSE)
##D 
##D # Now we are ready to use Load().
##D startDates <- c('19901101')
##D sampleData <- Load('tos', c('experiment'), c('observation'), startDates,
##D                    leadtimemin = 1, leadtimemax = 4, output = 'areave',
##D                    latmin = 27, latmax = 48, lonmin = -12, lonmax = 40,
##D                    configfile = configfile)
##D   
## End(Not run)
  ## Don't show: 
startDates <- c('19901101')
sampleData <- s2dverification:::.LoadSampleData('tos', c('experiment'),
                                                c('observation'), startDates,
                                                leadtimemin = 1,
                                                leadtimemax = 4,
                                                output = 'areave',
                                                latmin = 27, latmax = 48,
                                                lonmin = -12, lonmax = 40)
  
## End(Don't show)


start_dates_out <- c('19901101', '19911101', '19921101', '19931101', '19941101')
leadtimes_per_startdate <- 12
experimental_data <- Histo2Hindcast(sampleData$mod, startDates[1], 
                                    start_dates_out, leadtimes_per_startdate)
observational_data <- Histo2Hindcast(sampleData$obs, startDates[1], 
                                     start_dates_out, leadtimes_per_startdate)
PlotAno(experimental_data, observational_data, start_dates_out, 
        toptitle = paste('anomalies reorganized into shorter chunks'), 
        ytitle = 'K', fileout='tos_histo2hindcast.eps')



