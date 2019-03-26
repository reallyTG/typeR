library(s2dverification)


### Name: Load
### Title: Loads Experimental And Observational Data
### Aliases: Load
### Keywords: datagen

### ** Examples

# Let's assume we want to perform verification with data of a variable
# called 'tos' from a model called 'model' and observed data coming from 
# an observational dataset called 'observation'.
#
# The model was run in the context of an experiment named 'experiment'. 
# It simulated from 1st November in 1985, 1990, 1995, 2000 and 2005 for a 
# period of 5 years time from each starting date. 5 different sets of 
# initial conditions were used so an ensemble of 5 members was generated 
# for each starting date.
# The model generated values for the variables 'tos' and 'tas' in a 
# 3-hourly frequency but, after some initial post-processing, it was 
# averaged over every month.
# The resulting monthly average series were stored in a file for each 
# starting date for each variable with the data of the 5 ensemble members.
# The resulting directory tree was the following:
#   model
#    |--> experiment
#          |--> monthly_mean
#                |--> tos_3hourly
#                |     |--> tos_19851101.nc
#                |     |--> tos_19901101.nc
#                |               .
#                |               .
#                |     |--> tos_20051101.nc 
#                |--> tas_3hourly
#                      |--> tas_19851101.nc
#                      |--> tas_19901101.nc
#                                .
#                                .
#                      |--> tas_20051101.nc
# 
# The observation recorded values of 'tos' and 'tas' at each day of the 
# month over that period but was also averaged over months and stored in 
# a file per month. The directory tree was the following:
#   observation
#    |--> monthly_mean
#          |--> tos
#          |     |--> tos_198511.nc
#          |     |--> tos_198512.nc
#          |     |--> tos_198601.nc
#          |               .
#          |               .
#          |     |--> tos_201010.nc
#          |--> tas
#                |--> tas_198511.nc
#                |--> tas_198512.nc
#                |--> tas_198601.nc
#                          .
#                          .
#                |--> tas_201010.nc
#
# The model data is stored in a file-per-startdate fashion and the
# observational data is stored in a file-per-month, and both are stored in 
# a monthly frequency. The file format is NetCDF.
# Hence all the data is supported by Load() (see details and other supported 
# conventions in ?Load) but first we need to configure it properly.
#
# These data files are included in the package (in the 'sample_data' folder),
# only for the variable 'tos'. They have been interpolated to a very low 
# resolution grid so as to make it on CRAN.
# The original grid names (following CDO conventions) for experimental and 
# observational data were 't106grid' and 'r180x89' respectively. The final
# resolutions are 'r20x10' and 'r16x8' respectively. 
# The experimental data comes from the decadal climate prediction experiment 
# run at IC3 in the context of the CMIP5 project. Its name within IC3 local 
# database is 'i00k'. 
# The observational dataset used for verification is the 'ERSST' 
# observational dataset.
#
# The code is not run because it dispatches system calls to 'cdo' and 'nco'
# which is not allowed as per CRAN policies. You can run it in your system 
# though. Instead, the code in 'dontshow' is run, which loads the equivalent
# data already processed in R.
#
# Example 1: providing lists in 'exp' and 'obs'.
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
##D                    output = 'areave', latmin = 27, latmax = 48, 
##D                    lonmin = -12, lonmax = 40)
##D #
##D # Example 2: providing character strings in 'exp' and 'obs', and providing
##D # a configuration file.
##D # The configuration file 'sample.conf' that we will create in the example 
##D # has the proper entries to load these (see ?LoadConfigFile for details on 
##D # writing a configuration file). 
##D #
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
##D                    output = 'areave', latmin = 27, latmax = 48, 
##D                    lonmin = -12, lonmax = 40, configfile = configfile)
##D   
## End(Not run)
  ## Don't show: 
startDates <- c('19851101', '19901101', '19951101', '20001101', '20051101')
sampleData <- s2dverification:::.LoadSampleData('tos', c('experiment'), 
                                                c('observation'), startDates,
                                                output = 'areave', 
                                                latmin = 27, latmax = 48, 
                                                lonmin = -12, lonmax = 40) 
  
## End(Don't show) 



