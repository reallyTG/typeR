library(spaMM)


### Name: predict
### Title: Prediction from a model fit.
### Aliases: predict.HLfit predict get_fixefVar get_predVar get_residVar
###   get_respVar get_intervals intervals get_predCov_var_fix
###   preprocess_fix_corr

### ** Examples

data("blackcap")
fitobject <- corrHLfit(migStatus ~ 1 + Matern(1|latitude+longitude),data=blackcap,
                       ranFix=list(nu=4,rho=0.4,phi=0.05))
predict(fitobject)
getDistMat(fitobject)

#### multiple controls of prediction variances
## (1) fit with an additional random effect
grouped <- cbind(blackcap,grp=c(rep(1,7),rep(2,7))) 
fitobject <- corrHLfit(migStatus ~ 1 +  (1|grp) +Matern(1|latitude+longitude),
                       data=grouped,  ranFix=list(nu=4,rho=0.4,phi=0.05))

## (2) re.form usage to remove a random effect from point prediction and variances: 
predict(fitobject,re.form= ~ 1 +  Matern(1|latitude+longitude))

## (3) comparison of covariance matrices for two types of new data
moregroups <- grouped[1:5,]
rownames(moregroups) <- paste0("newloc",1:5)
moregroups$grp <- rep(3,5) ## all new data belong to an unobserved third group 
cov1 <- get_predVar(fitobject,newdata=moregroups,
                     variances=list(linPred=TRUE,cov=TRUE))
moregroups$grp <- 3:7 ## all new data belong to distinct unobserved groups
cov2 <- get_predVar(fitobject,newdata=moregroups,
                     variances=list(linPred=TRUE,cov=TRUE))
cov1-cov2 ## the expected off-diagonal covariance due to the common group in the first fit.

## Not run: 
##D ## prediction with distinct given phi's in different locations:
##D varphi <- cbind(blackcap,logphi=runif(14))
##D vphifit <- corrHLfit(migStatus ~ 1 + Matern(1|latitude+longitude), 
##D                      resid.model = list(formula=~0+offset(logphi)),
##D                      data=varphi,  ranFix=list(nu=4,rho=0.4))
##D # for respVar computation, one needs the resid.model formula to specify phi:
##D get_respVar(vphifit,newdata=data.frame(latitude=1,longitude=1,logphi=1))
##D # for predVar computation, phi is not needed 
##D #     (and could have been specified through ranFix):  
##D get_predVar(vphifit,newdata=data.frame(latitude=1,longitude=1))                     
##D 
##D ## Effects of numerically singular correlation matrix C:
##D fitobject <- corrHLfit(migStatus ~ 1 + Matern(1|latitude+longitude),data=blackcap,
##D                        ranFix=list(nu=10,rho=0.001)) ## numerically singular C
##D predict(fitobject) ## predicted mu computed as X beta + L v 
##D predict(fitobject,newdata=blackcap) ## predicted mu computed as X beta + C ##D 
##D #
##D fix_X_ZAC.object <- preprocess_fix_corr(fitobject,fixdata=blackcap)
##D get_predCov_var_fix(fitobject,newdata=blackcap[14,],fix_X_ZAC.object=fix_X_ZAC.object)
##D 
##D ## point predictions and variances with new X and Z
##D if(requireNamespace("rsae", quietly = TRUE)) {
##D   data("landsat")
##D   fitobject <- HLfit(HACorn ~ PixelsCorn + PixelsSoybeans + (1|CountyName),
##D                      data=landsat[-33,],HLmethod="ML")
##D   newXandZ <- unique(data.frame(PixelsCorn=landsat$MeanPixelsCorn,
##D                                 PixelsSoybeans=landsat$MeanPixelsSoybeans,
##D                                 CountyName=landsat$CountyName))
##D   predict(fitobject,newdata=newXandZ,variances = list(predVar=TRUE))
##D   get_predVar(fitobject,newdata=newXandZ,variances = list(predVar=TRUE))
##D }
##D 
## End(Not run)



