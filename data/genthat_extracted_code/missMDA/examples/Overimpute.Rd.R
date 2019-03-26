library(missMDA)


### Name: Overimpute
### Title: Overimputation diagnostic plot
### Aliases: Overimpute

### ** Examples

## Not run: 
##D require(Zelig)
##D data(ozone)
##D 
##D # First the number of components has to be chosen 
##D nb <- estim_ncpPCA(ozone[,1:11])
##D 
##D # Multiple Imputation with Bayesian method
##D res.BayesMIPCA<-MIPCA(ozone[,1:11],ncp=2,method.mi="Bayes",verbose=T)
##D 
##D # Regression on the multiply imputed data set and pooling
##D z.out <- zelig(maxO3~., model = "ls", data = res.BayesMIPCA$res.MI,cite=F)
##D summary(z.out,digits=5)
##D 
##D # Diagnostics
##D res.over<-Overimpute(res.BayesMIPCA)
##D 
## End(Not run)



