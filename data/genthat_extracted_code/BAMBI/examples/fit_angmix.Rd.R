library(BAMBI)


### Name: fit_angmix
### Title: Fitting Bivariate and univariate angular mixture models
### Aliases: fit_angmix

### ** Examples

# illustration only - more iterations needed for convergence
fit.vmsin.20 <- fit_angmix("vmsin", tim8, ncomp = 3, n.iter =  20,
                             n.chains = 1)
fit.vmsin.20


# Parallelization is implemented via future_lapply from the
# package future.apply. To parallelize, first provide a parallel
# plan() for futures. Otherwise the chains will run sequentially.
# Note that not all plan() might work on every OS, as they execute
# functions defined internally in fit_mixmodel. We suggest
# plan(multiprocess).

## Not run: 
##D library(future)
##D library(parallel)
##D plan(multiprocess)
##D 
##D set.seed(1)
##D MC.fit <- fit_angmix("vmsin", tim8, ncomp=3, n.iter=500,
##D                      n.chains = 3)
##D 
##D 
##D pointest(MC.fit)
##D 
##D MC.fix <- fix_label(MC.fit)
##D 
##D contour(MC.fit)
##D contour(MC.fix)
##D lpdtrace(MC.fit)
## End(Not run)




