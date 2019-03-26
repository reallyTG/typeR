library(s2dverification)


### Name: EnoNew
### Title: Computes Effective Sample Size Following Guemas et al, BAMS,
###   2013b
### Aliases: EnoNew
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
##D startDates <- c('19851101', '19901101', '19951101', '20001101', '20051101')
##D sampleData <- Load('tos', c('experiment'), c('observation'), startDates,
##D                    leadtimemin = 1, leadtimemax = 4, output = 'lonlat',
##D                    latmin = 27, latmax = 48, lonmin = -12, lonmax = 40,
##D                    configfile = configfile)
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
eno <- EnoNew(sampleData$mod[1, 1, , 1, 2, 3])
print(eno)



