library(missMDA)


### Name: MIMCA
### Title: Multiple Imputation with MCA
### Aliases: MIMCA
### Keywords: multivariate

### ** Examples

## Not run: 
##D data(TitanicNA)
##D 
##D ## First the number of components has to be chosen 
##D ##   (for the reconstruction step)
##D ## nb <- estim_ncpMCA(TitanicNA) ## Time-consuming, nb = 5
##D 
##D ## Multiple Imputation
##D res.mi <- MIMCA(TitanicNA, ncp=5, verbose=TRUE)
##D 
##D ## First completed data matrix
##D res.mi$res.MI[[1]]
##D  
##D ## Analysis and pooling with mice
##D require(mice)
##D imp<-prelim(res.mi,TitanicNA)
##D fit <- with(data=imp,exp=glm(SURV~CLASS+AGE+SEX,family = "binomial"))
##D res.pool<-pool(fit)
##D summary(res.pool)
##D 
## End(Not run)



