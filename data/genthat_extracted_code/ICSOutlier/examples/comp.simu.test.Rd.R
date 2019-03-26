library(ICSOutlier)


### Name: comp.simu.test
### Title: Selection of Nonnormal Invariant Components Using Simulations
### Aliases: comp.simu.test
### Keywords: multivariate

### ** Examples

# For a real analysis use larger values for m and more cores if available

set.seed(123)
Z <- rmvnorm(1000, rep(0, 6))
# Add 20 outliers on the first component
Z[1:20, 1] <- Z[1:20, 1] + 10
pairs(Z)
icsZ <- ics2(Z)
# For demo purpose only small m value, should select the first component
comp.simu.test(icsZ, m = 400, ncores = 1)

## Not run: 
##D # For using two cores
##D # For demo purpose only small m value, should select the first component
##D comp.simu.test(icsZ, m = 500, ncores = 2, iseed = 123)
##D   
##D # For using several cores and for using a scatter function from a different package
##D # Using the parallel package to detect automatically the number of cores
##D library(parallel)
##D # ICS with MCD estimates and the usual estimates
##D # Need to create a wrapper for the CovMcd function to return first the location estimate
##D # and the scatter estimate secondly.
##D library(rrcov)
##D myMCD <- function(x,...){
##D   mcd <- CovMcd(x,...)
##D   return(list(location = mcd@center, scatter = mcd@cov))
##D }
##D icsZmcd <- ics2(Z, S1 = myMCD, S2 = MeanCov, S1args = list(alpha = 0.75))
##D # For demo purpose only small m value, should select the first component
##D comp.simu.test(icsZmcd, m = 500, ncores = detectCores()-1, 
##D                pkg = c("ICSOutlier", "rrcov"), iseed = 123)
## End(Not run)

# Example with no outlier
Z0 <- rmvnorm(1000, rep(0, 6))
pairs(Z0)
icsZ0 <- ics2(Z0)
#Should select no component
comp.simu.test(icsZ0, m = 400, level = 0.01, ncores = 1)



