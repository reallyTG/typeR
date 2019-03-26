library(miceadds)


### Name: pool_mi
### Title: Statistical Inference for Multiply Imputed Datasets
### Aliases: pool_mi summary.pool_mi coef.pool_mi vcov.pool_mi
### Keywords: summary coef vcov

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Statistical inference for models based on imputationList
##D #############################################################################
##D 
##D library(mitools)
##D library(mice)
##D library(Zelig)
##D library(mitml)
##D library(lavaan)
##D library(semTools)
##D data(data.ma02)
##D 
##D # save dataset as imputation list
##D imp <- mitools::imputationList( data.ma02 )
##D # mids object
##D imp0 <- miceadds::datlist2mids( imp )
##D # datlist object
##D imp1 <- miceadds::datlist_create(data.ma02)
##D 
##D #--- apply linear model based on imputationList
##D mod <- with( imp, stats::lm( read ~ hisei + female ) )
##D #--- apply linear model for mids object
##D mod0 <- with( imp0, stats::lm( read ~ hisei + female ) )
##D # extract coefficients
##D cmod <- mitools::MIextract( mod, fun=coef)
##D # extract standard errors
##D semod <- lapply( mod, FUN=function(mm){
##D     smm <- summary(mm)
##D     smm$coef[,"Std. Error"]
##D } )
##D # extract covariance matrix
##D vmod <- mitools::MIextract( mod, fun=vcov)
##D 
##D #*** pooling based on covariance matrices
##D res1 <- miceadds::pool_mi( qhat=cmod, u=vmod )
##D summary(res1)
##D coef(res1)
##D vcov(res1)
##D 
##D #*** pooling based on standard errors
##D res2 <- miceadds::pool_mi( qhat=cmod, se=semod )
##D 
##D #*** pooling with MIcombine
##D res3 <- mitools::MIcombine( results=cmod, variances=vmod )
##D 
##D #*** pooling with pool function in mice
##D res4 <- mice::pool( mod0 )
##D 
##D #*** analysis in Zelig
##D # convert datalist into object of class amelia
##D mi02 <- list( "imputations"=data.ma02)
##D class(mi02) <- "amelia"
##D res5 <- Zelig::zelig( read ~ hisei + female, model="ls", data=mi02 )
##D 
##D #*** analysis in lavaan
##D lavmodel <- "
##D      read ~ hisei + female
##D      read ~~ a*read
##D      read ~ 1
##D      # residual standard deviation
##D      sde :=sqrt(a)
##D        "
##D # analysis for first imputed dataset
##D mod6a <- lavaan::sem( lavmodel, data=imp1[[1]] )
##D summary(mod6a)
##D # analysis based on all datasets using with
##D mod6b <- lapply( imp1, FUN=function(data){
##D            res <- lavaan::sem( lavmodel, data=data )
##D            return(res)
##D                 } )
##D # extract parameters and covariance matrices
##D qhat0 <- lapply( mod6b, FUN=function(ll){  coef(ll) } )
##D u0 <- lapply( mod6b, FUN=function(ll){  vcov(ll) } )
##D res6b <- mitools::MIcombine( results=qhat0, variances=u0 )
##D 
##D # extract informations for all parameters
##D qhat <- lapply( mod6b, FUN=function(ll){
##D         h1 <- lavaan::parameterEstimates(ll)
##D         parnames <- paste0( h1$lhs, h1$op, h1$rhs )
##D         v1 <- h1$est
##D         names(v1) <- parnames
##D         return(v1)
##D      } )
##D se <- lapply( mod6b, FUN=function(ll){
##D         h1 <- lavaan::parameterEstimates(ll)
##D         parnames <- paste0( h1$lhs, h1$op, h1$rhs )
##D         v1 <- h1$se
##D         names(v1) <- parnames
##D         return(v1)
##D      } )
##D res6c <- miceadds::pool_mi( qhat=qhat, se=se )
##D 
##D # function runMI in semTools package
##D res6d <- semTools::runMI(model=lavmodel, data=imp1, m=length(imp1) )
##D   # semTools version 0.4-9 provided an error message
##D # perform inference with mitml package
##D se2 <- lapply( se, FUN=function(ss){  ss^2  } )  # input variances
##D res6e <- mitml::testEstimates(qhat=qhat, uhat=se2)
##D 
##D #*** complete model estimation and inference in mitml
##D 
##D # convert into object of class mitml.list
##D ml02 <- mitml::as.mitml.list( data.ma02)
##D # estimate regression
##D mod7 <- with( ml02, stats::lm( read ~ hisei + female ) )
##D # inference
##D res7 <- mitml::testEstimates( mod7 )
##D 
##D #*** model comparison
##D summary(res1)
##D summary(res2)
##D summary(res3)
##D summary(res4)
##D summary(res5)
##D summary(res6b)
##D summary(res6c)
##D print(res6e)
##D print(res7)
## End(Not run)



