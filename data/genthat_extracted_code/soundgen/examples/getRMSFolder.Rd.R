library(soundgen)


### Name: getRMSFolder
### Title: RMS amplitude per folder
### Aliases: getRMSFolder

### ** Examples

## Not run: 
##D getRMSFolder('~/Downloads/temp')
##D # Compare:
##D analyzeFolder('~/Downloads/temp', pitchMethods = NULL,
##D               plot = FALSE)$ampl_mean
##D # (per STFT frame, but should be very similar)
##D 
##D User-defined summary functions:
##D getRMSFolder('~/Downloads/temp', summaryFun = function(x) diff(range(x)))
##D getRMSFolder('~/Downloads/temp',
##D   summaryFun = function(x) paste0('mean = ', round(mean(x), 2),
##D                                  '; sd = ', round(sd(x), 2)))
## End(Not run)



