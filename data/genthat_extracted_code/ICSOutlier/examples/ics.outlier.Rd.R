library(ICSOutlier)


### Name: ics.outlier
### Title: Outlier Detection Using ICS
### Aliases: ics.outlier
### Keywords: multivariate

### ** Examples

# ReliabilityData example: the observations 414 and 512 are suspected to be outliers  
library(REPPlab)
data(ReliabilityData)
icsReliabilityData <- ics2(ReliabilityData, S1 = tM, S2 = MeanCov)
# For demo purpose only small mDist value, but as extreme quantiles 
# are of interest mDist should be much larger. Also number of cores used
# should be larger if available
icsOutlierDA <- ics.outlier(icsReliabilityData, level.dist = 0.01, mDist = 50, ncores = 1)
icsOutlierDA
summary(icsOutlierDA)
plot(icsOutlierDA)

## Not run: 
##D # For using several cores and for using a scatter function from a different package
##D # Using the parallel package to detect automatically the number of cores
##D library(parallel)
##D # ICS with MCD estimates and the usual estimates
##D # Need to create a wrapper for the CovMcd function to return first the location estimate
##D # and the scatter estimate secondly.
##D data(HTP)
##D library(rrcov)
##D myMCD <- function(x,...){
##D   mcd <- CovMcd(x,...)
##D   return(list(location = mcd@center, scatter = mcd@cov))
##D }
##D icsHTP <- ics2(HTP, S1 = myMCD, S2 = MeanCov, S1args = list(alpha = 0.75))
##D # For demo purpose only small m value, should select the first seven components
##D icsOutlier <- ics.outlier(icsHTP, mEig = 50, level.test = 0.05, adjust = TRUE, 
##D                           level.dist = 0.025, mDist = 50,
##D                           ncores =  detectCores()-1, iseed = 123, 
##D                           pkg = c("ICSOutlier", "rrcov"))
##D icsOutlier
## End(Not run)
  
# Exemple of no direction and hence also no outlier
set.seed(123)
X = rmvnorm(500, rep(0, 2), diag(rep(0.1,2)))
icsX <- ics2(X)
icsOutlierJB <- ics.outlier(icsX, test = "jarque", level.dist = 0.01, 
				level.test = 0.01, mDist = 100, ncores = 1)
summary(icsOutlierJB)
plot(icsOutlierJB)
rm(.Random.seed)

     

# Example of no outlier
set.seed(123)
X = matrix(rweibull(1000, 4, 4), 500, 2)
X = apply(X,2, function(x){ifelse(x<5 & x>2, x, runif(sum(!(x<5 & x>2)), 5, 5.5))}) 
icsX <- ics2(X)
icsOutlierAG <- ics.outlier(icsX, test = "anscombe", level.dist = 0.01, 
				level.test = 0.05, mDist = 100, ncores = 1)
summary(icsOutlierAG)
plot(icsOutlierAG)
rm(.Random.seed)
  




