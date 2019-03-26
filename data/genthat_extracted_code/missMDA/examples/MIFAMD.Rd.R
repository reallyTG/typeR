library(missMDA)


### Name: MIFAMD
### Title: Multiple Imputation with FAMD
### Aliases: MIFAMD
### Keywords: multivariate

### ** Examples

## Not run: 
##D data(ozone)
##D 
##D ## First the number of components has to be chosen 
##D ##   (for the reconstruction step)
##D  nb <- estim_ncpFAMD(ozone) ## Time-consuming, nb = 2
##D 
##D 
##D ## Multiple Imputation
##D res.mi<-MIFAMD(ozone,ncp = 2,nboot=50)
##D 
##D 
##D ## First completed data matrix
##D head(res.mi$res.MI[[1]])
##D 
##D ## Analysis and pooling with mice
##D require(mice)
##D imp<-prelim(res.mi,ozone)
##D fit <- with(data=imp,exp=lm(maxO3~T9+T12+T15+Ne9+Ne12+Ne15+Vx9+Vx12+Vx15+maxO3v+vent+pluie))
##D res.pool<-pool(fit)
##D summary(res.pool)
## End(Not run)



