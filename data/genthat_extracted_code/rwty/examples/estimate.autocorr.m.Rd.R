library(rwty)


### Name: estimate.autocorr.m
### Title: Calculate sampling interval based on exponential semivariogram
###   model.
### Aliases: estimate.autocorr.m
### Keywords: autocorrelation, distance path

### ** Examples

data(fungus)
## Not run: 
##D # To get a good estimate we need all sampling intervals
##D autocorr.intervals = as.integer(length(fungus[[1]]$trees)/21)
##D sampling.table <- topological.autocorr(fungus, burnin = 20, autocorr.intervals = autocorr.intervals)
##D estimate.autocorr.m(sampling.table)
## End(Not run)



