library(s2dverification)


### Name: ToyModel
### Title: Synthetic forecast generator imitating seasonal to decadal
###   forecasts. The components of a forecast: (1) predictabiltiy (2)
###   forecast error (3) non-stationarity and (4) ensemble generation. The
###   forecast can be computed for real observations or observations
###   generated artifically.
### Aliases: ToyModel
### Keywords: datagen

### ** Examples

# Example 1: Generate forecast with artifical observations
# Seasonal prediction example
a <- 0.1
b <- 0.3
g <- 1
sig <- 1
t <- 0.02
ntd <- 30
nlt <- 4
nm <- 10
toyforecast <- ToyModel(alpha = a, beta = b, gamma = g, sig = sig, trend = t, 
                        nstartd = ntd, nleadt = nlt, nmemb = nm)

# Example 2: Generate forecast from loaded observations
# Decadal prediction example
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

a <- 0.1
b <- 0.3
g <- 1
nm <- 10

toyforecast <- ToyModel(alpha = a, beta = b, gamma = g, nmemb = nm, 
                        obsini = sampleData$obs, nstartd = 5, nleadt = 60)
PlotAno(toyforecast$mod, toyforecast$obs, startDates, 
        toptitle = c("Synthetic decadal temperature prediction"), 
        fileout = "ex_toymodel.eps") 



