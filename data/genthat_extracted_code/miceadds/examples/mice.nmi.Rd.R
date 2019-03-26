library(miceadds)


### Name: mice.nmi
### Title: Nested Multiple Imputation
### Aliases: mice.nmi summary.mids.nmi print.mids.nmi
### Keywords: Nested multiple imputation

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Nested multiple imputation for TIMSS data
##D #############################################################################
##D 
##D library(BIFIEsurvey)
##D data(data.timss2, package="BIFIEsurvey" )
##D datlist <- data.timss2
##D    # list of 5 datasets containing 5 plausible values
##D 
##D #** define imputation method and predictor matrix
##D data <- datlist[[1]]
##D V <- ncol(data)
##D # variables
##D vars <- colnames(data)
##D # variables not used for imputation
##D vars_unused <- miceadds::scan.vec("IDSTUD TOTWGT  JKZONE  JKREP" )
##D 
##D #- define imputation method
##D impMethod <- rep("norm", V )
##D names(impMethod) <- vars
##D impMethod[ vars_unused ] <- ""
##D 
##D #- define predictor matrix
##D predM <- matrix( 1, V, V )
##D colnames(predM) <- rownames(predM) <- vars
##D diag(predM) <- 0
##D predM[, vars_unused ] <- 0
##D 
##D #***************
##D # (1) nested multiple imputation using mice
##D imp1 <- miceadds::mice.nmi( datlist, method=impMethod, predictorMatrix=predM,
##D                 m=4, maxit=3 )
##D summary(imp1)
##D 
##D #***************
##D # (2) nested multiple imputation using mice.1chain
##D imp2 <- miceadds::mice.nmi( datlist, method=impMethod, predictorMatrix=predM,
##D             Nimp=4, burnin=10,iter=22, type="mice.1chain")
##D summary(imp2)
## End(Not run)



