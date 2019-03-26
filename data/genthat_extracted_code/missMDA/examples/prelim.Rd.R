library(missMDA)


### Name: prelim
### Title: Converts a dataset imputed by MIMCA or MIPCA into a mids object
### Aliases: prelim
### Keywords: multivariate,imputation,categorical,nominal

### ** Examples

## Not run: 
##D data(TitanicNA)
##D 
##D ## First the number of components has to be chosen 
##D ##   (for the reconstruction step)
##D ## nb <- estim_ncpMCA(TitanicNA,ncp.max=5) ## Time-consuming, nb = 5
##D 
##D ## Multiple Imputation
##D res.mi <- MIMCA(TitanicNA, ncp=5, verbose=T)
##D 
##D #Analysis
##D imp<-prelim(res.mi,TitanicNA)
##D fit <- with(data=imp,exp=glm(SURV~CLASS+AGE+SEX,family = "binomial"))
##D 
##D #Pooling
##D res.pool<-pool(fit)
##D summary(res.pool)
## End(Not run)



