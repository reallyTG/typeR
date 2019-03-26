library(miceadds)


### Name: micombine.cor
### Title: Inference for Correlations and Covariances for Multiply Imputed
###   Datasets
### Aliases: micombine.cor micombine.cov
### Keywords: Decriptives mids

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: nhanes data | combination of correlation coefficients
##D #############################################################################
##D 
##D library(mice)
##D data(nhanes, package="mice")
##D set.seed(9090)
##D 
##D # nhanes data in one chain
##D imp.mi <- miceadds::mice.1chain( nhanes, burnin=5, iter=20, Nimp=4,
##D                   method=rep("norm", 4 ) )
##D # correlation coefficients of variables 4, 2 and 3 (indexed in nhanes data)
##D res <- miceadds::micombine.cor(mi.res=imp.mi, variables=c(4,2,3) )
##D   ##     variable1 variable2       r    rse fisher_r fisher_rse    fmi       t      p
##D   ##   1       chl       bmi  0.2458 0.2236   0.2510     0.2540 0.3246  0.9879 0.3232
##D   ##   2       chl       hyp  0.2286 0.2152   0.2327     0.2413 0.2377  0.9643 0.3349
##D   ##   3       bmi       hyp -0.0084 0.2198  -0.0084     0.2351 0.1904 -0.0358 0.9714
##D   ##     lower95 upper95
##D   ##   1 -0.2421  0.6345
##D   ##   2 -0.2358  0.6080
##D   ##   3 -0.4376  0.4239
##D 
##D # extract matrix with correlations and its standard errors
##D attr(res, "r_matrix")
##D attr(res, "rse_matrix")
##D 
##D # inference for covariance
##D res2 <- miceadds::micombine.cov(mi.res=imp.mi, variables=c(4,2,3) )
##D 
##D # inference can also be conducted for non-imputed data
##D res3 <- miceadds::micombine.cov(mi.res=nhanes, variables=c(4,2,3) )
##D 
##D #############################################################################
##D # EXAMPLE 2: nhanes data | comparing different correlation coefficients
##D #############################################################################
##D 
##D library(psych)
##D library(mitools)
##D 
##D # imputing data
##D imp1 <- mice::mice( nhanes,  method=rep("norm", 4 ) )
##D summary(imp1)
##D 
##D #*** Pearson correlation
##D res1 <- miceadds::micombine.cor(mi.res=imp1, variables=c(4,2) )
##D 
##D #*** Spearman rank correlation
##D res2 <- miceadds::micombine.cor(mi.res=imp1, variables=c(4,2),  method="spearman")
##D 
##D #*** Kendalls tau
##D # test of computation of tau for first imputed dataset
##D dat1 <- mice::complete(imp1, action=1)
##D tau1 <- psych::corr.test(x=dat1[,c(4,2)], method="kendall")
##D tau1$r[1,2]    # estimate
##D tau1$se     # standard error
##D 
##D # results of Kendalls tau for all imputed datasets
##D res3 <- with( data=imp1,
##D         expr=psych::corr.test( x=cbind( chl, bmi ), method="kendall") )
##D # extract estimates
##D betas <- lapply( res3$analyses, FUN=function(ll){ ll$r[1,2] } )
##D # extract variances
##D vars <- lapply( res3$analyses, FUN=function(ll){ (ll$se[1,2])^2 } )
##D # Rubin inference
##D tau_comb <- mitools::MIcombine( results=betas, variances=vars )
##D summary(tau_comb)
##D 
##D #############################################################################
##D # EXAMPLE 3: Inference for correlations for nested multiply imputed datasets
##D #############################################################################
##D 
##D library(BIFIEsurvey)
##D data(data.timss4, package="BIFIEsurvey" )
##D datlist <- data.timss4
##D 
##D # object of class nested.datlist
##D datlist <- miceadds::nested.datlist_create(datlist)
##D # inference for correlations
##D res2 <- miceadds::micombine.cor(mi.res=datlist, variables=c("lang", "migrant", "ASMMAT"))
## End(Not run)



