library(missMDA)


### Name: MIPCA
### Title: Multiple Imputation with PCA
### Aliases: MIPCA
### Keywords: multivariate

### ** Examples

## Not run: 
##D #########################################################
##D ## Multiple Imputation for visualization on the PCA map
##D #########################################################
##D 
##D data(orange)
##D ## First the number of components has to be chosen 
##D ##   (for the reconstruction step)
##D nb <- estim_ncpPCA(orange,ncp.max=4)
##D 
##D ## Multiple Imputation
##D resMI <- MIPCA(orange,ncp=2)
##D 
##D ## Visualization on the PCA map
##D plot(resMI)
##D 
##D #########################################################
##D ## Multiple Imputation for applying statistical methods
##D (Bayesian method)
##D #########################################################
##D data(ozone)
##D 
##D ## First the number of components has to be chosen 
##D nb <- estim_ncpPCA(ozone[,1:11])
##D 
##D ## Multiple Imputation with Bayesian method
##D res.BayesMIPCA<-MIPCA(ozone[,1:11],ncp=2,method.mi="Bayes",verbose=TRUE)
##D 
##D ## Regression on the multiply imputed data set and pooling with mice
##D require(mice)
##D imp<-prelim(res.mi=res.BayesMIPCA,X=ozone[,1:11])#creating a mids object
##D fit <- with(data=imp,exp=lm(maxO3~T9+T12+T15+Ne9+Ne12+Ne15+Vx9+Vx12+Vx15+maxO3v))#analysis
##D res.pool<-pool(fit);summary(res.pool)#pooling
##D 
##D ## Diagnostics
##D res.over<-Overimpute(res.BayesMIPCA)
## End(Not run)



