library(miceadds)


### Name: mice.impute.eap
### Title: Imputation of a Variable with a Known Posterior Distribution
### Aliases: mice.impute.eap
### Keywords: mice imputation method

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Imputation based on known posterior distribution
##D #############################################################################
##D 
##D data(data.ma03)
##D dat <- data.ma03
##D 
##D # definiere variable 'math_PV' as the plausible value imputation of math
##D dat$math_PV <- NA
##D vars <- colnames(dat)
##D dat1 <- as.matrix( dat[,vars] )
##D 
##D # define imputation methods
##D impmethod <- rep( "pmm", length(vars) )
##D names(impmethod) <- vars
##D # define plausible value imputation based on EAP and SEEAP for 'math_PV'
##D impmethod[ "math_PV" ] <- "eap"
##D eap <- list( "math_PV"=list( "M"=dat$math_EAP, "SE"=dat$math_SEEAP  ) )
##D # define predictor matrix
##D pM <- 1 - diag(1,length(vars))
##D rownames(pM) <- colnames(pM) <- vars
##D pM[,c("idstud","math_EAP", "math_SEEAP") ] <- 0
##D     # remove some variables from imputation model
##D 
##D # imputation using three parallel chains
##D imp1 <- mice::mice( dat1, m=3, maxit=5, imputationMethod=impmethod,
##D                predictorMatrix=pM, allow.na=TRUE, eap=eap )
##D summary(imp1)   # summary
##D 
##D # imputation using one long chain
##D imp2 <- miceadds::mice.1chain( dat1, burnin=10, iter=20, Nimp=3,
##D             imputationMethod=impmethod, predictorMatrix=pM,  allow.na=TRUE, eap=eap)
##D summary(imp2)    # summary
## End(Not run)



