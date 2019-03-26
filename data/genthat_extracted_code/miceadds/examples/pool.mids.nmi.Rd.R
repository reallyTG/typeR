library(miceadds)


### Name: pool.mids.nmi
### Title: Pooling for Nested Multiple Imputation
### Aliases: pool.mids.nmi summary.mipo.nmi coef.mipo.nmi vcov.mipo.nmi
###   NMIcombine NMIextract pool_nmi
### Keywords: Nested multiple imputation summary coef vcov

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Nested multiple imputation and statistical inference
##D #############################################################################
##D 
##D library(BIFIEsurvey)
##D data(data.timss2, package="BIFIEsurvey" )
##D datlist <- data.timss2
##D # remove first four variables
##D M <- length(datlist)
##D for (ll in 1:M){
##D     datlist[[ll]] <- datlist[[ll]][, -c(1:4) ]
##D                }
##D 
##D #***************
##D # (1) nested multiple imputation using mice
##D imp1 <- miceadds::mice.nmi( datlist,  m=3, maxit=2 )
##D summary(imp1)
##D 
##D #***************
##D # (2) first linear regression: ASMMAT ~ migrant + female
##D res1 <- with( imp1, stats::lm( ASMMAT ~ migrant + female ) ) # fit
##D pres1 <- miceadds::pool.mids.nmi( res1 )  # pooling
##D summary(pres1)  # summary
##D coef(pres1)
##D vcov(pres1)
##D 
##D #***************
##D # (3) second linear regression: likesc ~ migrant + books
##D res2 <- with( imp1, stats::lm( likesc ~ migrant + books  ) )
##D pres2 <- miceadds::pool.mids.nmi( res2 )
##D summary(pres2)
##D 
##D #***************
##D # (4) some descriptive statistics using the mids.nmi object
##D res3 <- with( imp1, c( "M_lsc"=mean(likesc), "SD_lsc"=stats::sd(likesc) ) )
##D pres3 <- miceadds::NMIcombine( qhat=res3$analyses )
##D summary(pres3)
##D 
##D #*************
##D # (5) apply linear regression based on imputation list
##D 
##D # convert mids object to datlist
##D datlist2 <- miceadds::mids2datlist( imp1 )
##D str(datlist2, max.level=1)
##D 
##D # double application of lapply to the list of list of nested imputed datasets
##D res4 <- lapply( datlist2, FUN=function(dl){
##D     lapply( dl, FUN=function(data){
##D             stats::lm( ASMMAT ~ migrant + books, data=data )
##D                                 } )
##D                 }  )
##D 
##D # extract coefficients
##D qhat <- lapply( res4, FUN=function(bb){
##D             lapply( bb, FUN=function(ww){
##D                     coef(ww)
##D                         } )
##D                 } )
##D # shorter function
##D NMIextract( results=res4, fun=coef )
##D 
##D # extract covariance matrices
##D u <- lapply( res4, FUN=function(bb){
##D             lapply( bb, FUN=function(ww){
##D                     vcov(ww)
##D                         } )
##D                 } )
##D # shorter function
##D NMIextract( results=res4, fun=vcov )
##D 
##D # apply statistical inference using the NMIcombine function
##D pres4 <- miceadds::NMIcombine( qhat=qhat, u=u )
##D summary(pres4)
##D 
##D #--- statistical inference if only standard errors are available
##D # extract standard errors
##D se <- lapply( res4, FUN=function(bb){
##D             lapply( bb, FUN=function(ww){
##D                 # ww <- res4[[1]][[1]]
##D                 sww <- summary(ww)
##D                 sww$coef[,"Std. Error"]
##D                         } )
##D                 } )
##D se
##D # apply NMIcombine function
##D pres4b <- miceadds::NMIcombine( qhat=qhat, se=se )
##D # compare results
##D summary(pres4b)
##D summary(pres4)
##D 
##D #############################################################################
##D # EXAMPLE 2: Some comparisons for a multiply imputed dataset
##D #############################################################################
##D 
##D library(mitools)
##D data(data.ma02)
##D 
##D # save dataset as imputation list
##D imp <- mitools::imputationList( data.ma02 )
##D print(imp)
##D # save dataset as an mids object
##D imp1 <- miceadds::datlist2mids( imp )
##D 
##D # apply linear model based on imputationList
##D mod <- with( imp, stats::lm( read ~ hisei + female ) )
##D # same linear model based on mids object
##D mod1 <- with( imp1, stats::lm( read ~ hisei + female ) )
##D 
##D # extract coefficients
##D cmod <- mitools::MIextract( mod, fun=coef)
##D # extract standard errors
##D semod <- lapply( mod, FUN=function(mm){
##D                 smm <- summary(mm)
##D                 smm$coef[,"Std. Error"]
##D                         } )
##D # extract covariance matrix
##D vmod <- mitools::MIextract( mod, fun=vcov)
##D 
##D #*** pooling with NMIcombine with se (1a) and vcov (1b) as input
##D pmod1a <- miceadds::NMIcombine( qhat=cmod, se=semod, NMI=FALSE )
##D pmod1b <- miceadds::NMIcombine( qhat=cmod, u=vmod, NMI=FALSE )
##D # use method 2 which should conform to MI inference of mice::pool
##D pmod1c <- miceadds::NMIcombine( qhat=cmod, u=vmod, NMI=FALSE, method=2)
##D 
##D #*** pooling with mitools::MIcombine function
##D pmod2 <- mitools::MIcombine( results=cmod, variances=vmod )
##D #*** pooling with mice::pool function
##D pmod3a <- mice::pool( mod1 )
##D pmod3b <- mice::pool( mod1, method="Rubin")
##D 
##D #--- compare results
##D summary(pmod1a)   # method=1  (the default)
##D summary(pmod1b)   # method=1  (the default)
##D summary(pmod1c)   # method=2
##D summary(pmod2)
##D summary(pmod3a)
##D summary(pmod3b)
## End(Not run)



