library(miceadds)


### Name: mice.impute.pls
### Title: Imputation using Partial Least Squares for Dimension Reduction
### Aliases: mice.impute.pls mice.impute.2l.pls2
### Keywords: Partial least squares regression (PLS) Dimension reduction
###   mice imputation method

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: PLS imputation method for internet data
##D #############################################################################
##D 
##D data(data.internet)
##D dat <- data.internet
##D 
##D # specify predictor matrix
##D predictorMatrix <- matrix( 1, ncol(dat), ncol(dat) )
##D rownames(predictorMatrix) <- colnames(predictorMatrix) <- colnames(dat)
##D diag( predictorMatrix) <- 0
##D 
##D # use PLS imputation method for all variables
##D impMethod <- rep( "pls", ncol(dat) )
##D names(impMethod) <- colnames(dat)
##D 
##D # define predictors for interactions (entries with type 4 in predictorMatrix)
##D predictorMatrix[c("IN1","IN15","IN16"),c("IN1","IN3","IN10","IN13")] <- 4
##D # define predictors which should appear as linear and quadratic terms (type 5)
##D predictorMatrix[c("IN1","IN8","IN9","IN10","IN11"),c("IN1","IN2","IN7","IN5")] <- 5
##D 
##D # use 9 PLS factors for all variables
##D pls.facs <- as.list( rep( 9, length(impMethod) ) )
##D names(pls.facs) <- names(impMethod)
##D pls.facs$IN1 <- 15   # use 15 PLS factors for variable IN1
##D 
##D # choose norm or pmm imputation method
##D pls.impMethod <- as.list( rep("norm", length(impMethod) ) )
##D names(pls.impMethod) <- names(impMethod)
##D pls.impMethod[ c("IN1","IN6")] <- "pmm5"
##D 
##D # some arguments for imputation method
##D pls.impMethodArgs <- list( "IN1"=list( "donors"=10 ),
##D                            "IN2"=list( "ridge2"=1E-4 ) )
##D 
##D # Model 1: Three parallel chains
##D imp1 <- mice::mice(data=dat, method=impMethod,
##D      m=3, maxit=5, predictorMatrix=predictorMatrix,
##D      pls.facs=pls.facs, # number of PLS factors
##D      pls.impMethod=pls.impMethod,  # Imputation Method in PLS imputation
##D      pls.impMethodArgs=pls.impMethodArgs, # arguments for imputation method
##D      pls.print.progress=TRUE, ls.meth="ridge" )
##D summary(imp1)
##D 
##D # Model 2: One long chain
##D imp2 <- miceadds::mice.1chain(data=dat, method=impMethod,
##D      burnin=10, iter=21, Nimp=3, predictorMatrix=predictorMatrix,
##D      pls.facs=pls.facs, pls.impMethod=pls.impMethod,
##D      pls.impMethodArgs=pls.impMethodArgs, ls.meth="ridge" )
##D summary(imp2)
## End(Not run)



