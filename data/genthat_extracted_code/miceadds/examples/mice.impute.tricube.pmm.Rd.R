library(miceadds)


### Name: mice.impute.tricube.pmm
### Title: Imputation by Tricube Predictive Mean Matching
### Aliases: mice.impute.tricube.pmm mice.impute.tricube.pmm2
### Keywords: mice imputation method

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Tricube predictive mean matching for nhanes data
##D #############################################################################
##D 
##D library(mice)
##D data(nhanes, package="mice")
##D set.seed(9090)
##D 
##D #*** Model 1: Use default of tricube predictive mean matching
##D varnames <- colnames(nhanes)
##D VV <- length(varnames)
##D method <- rep("tricube.pmm2", VV )
##D names(method) <- varnames
##D # imputation with mice
##D imp.mi1 <- mice::mice( nhanes, m=5, maxit=4, method=method )
##D 
##D #*** Model 2: use item-specific imputation methods
##D iM2 <- method
##D iM2["bmi"] <- "pmm6"
##D # use tricube.pmm2 for hyp and chl
##D # select different scale parameters for these variables
##D tricube.pmm.scale1 <- list( "hyp"=.15, "chl"=.30 )
##D imp.mi2 <- miceadds::mice.1chain( nhanes, burnin=5, iter=20, Nimp=4,
##D     method=iM2, tricube.pmm.scale=tricube.pmm.scale1  )
## End(Not run)



