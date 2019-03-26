library(WRTDStidal)


### Name: wrtdscv
### Title: Use k-fold cross-validation to evaluate WRTDS model fit
### Aliases: wrtdscv wrtdscv.default

### ** Examples

## Not run: 
##D 
##D library(doParallel)
##D ncores <- detectCores() - 1  
##D registerDoParallel(cores = ncores)
##D 
##D # half-window widths to evaluate
##D # months, years, and salinity/flow
##D wins <- list(0.5, 10, 0.5) 
##D 
##D # get ocv score for k = 10
##D wrtdscv(tidobjmean, wins = wins)
##D 
##D # get ocv score k = 2, tau = 0.2 
##D wrtdscv(tidobj, wins = wins, tau = 0.2)
## End(Not run)



