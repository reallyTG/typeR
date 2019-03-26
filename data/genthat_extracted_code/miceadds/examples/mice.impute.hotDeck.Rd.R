library(miceadds)


### Name: mice.impute.hotDeck
### Title: Imputation of a Variable Using Probabilistic Hot Deck Imputation
### Aliases: mice.impute.hotDeck
### Keywords: mice imputation method

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Hot deck imputation NHANES dataset
##D #############################################################################
##D 
##D data(nhanes, package="mice")
##D dat <- nhanes
##D 
##D #*** prepare imputation method
##D vars <- colnames(dat)
##D V <- length(vars)
##D impMethod <- rep("hotDeck", V)
##D method <- "cor"
##D 
##D #*** imputation in mice
##D imp <- mice::mice( data=as.matrix(dat), m=1, method=impMethod, method=method )
##D summary(imp)
## End(Not run)



