library(miceadds)


### Name: mice.impute.weighted.pmm
### Title: Imputation by Weighted Predictive Mean Matching or Weighted
###   Normal Linear Regression
### Aliases: mice.impute.weighted.pmm mice.impute.weighted.norm
### Keywords: Predictive mean matching Sampling weights mice imputation
###   method

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Imputation using sample weights
##D #############################################################################
##D 
##D data( data.ma01)
##D set.seed(977)
##D 
##D # select subsample
##D dat <- as.matrix(data.ma01)
##D dat <- dat[ 1:1000, ]
##D 
##D # empty imputation
##D imp0 <- mice::mice( dat, maxit=0)
##D 
##D # redefine imputation methods
##D meth <- imp0$method
##D meth[ meth=="pmm"  ] <- "weighted.pmm"
##D meth[ c("paredu", "books", "migrant" ) ] <- "weighted.norm"
##D # redefine predictor matrix
##D pm <- imp0$predictorMatrix
##D pm[, 1:3 ] <- 0
##D # do imputation
##D imp <- mice::mice( dat, predictorMatrix=pm, method=meth,
##D            imputationWeights=dat[,"studwgt"], m=3, maxit=5)
## End(Not run)



