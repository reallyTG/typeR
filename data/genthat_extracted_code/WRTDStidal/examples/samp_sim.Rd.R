library(WRTDStidal)


### Name: samp_sim
### Title: Sample a daily time series at a set frequency
### Aliases: samp_sim

### ** Examples

## Not run: 
##D ## example data
##D data(daydat)
##D 
##D ## simulate
##D tosamp <- all_sims(daydat)
##D 
##D ## sample
##D samp_sim(tosamp)
##D 
##D ## sample and create test dataset
##D # test dataset is 30% size of monthly subsample using block sampling with size = 4
##D samp_sim(tosamp, missper = 0.3, blck = 4)
## End(Not run)



