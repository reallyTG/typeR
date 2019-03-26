library(missMDA)


### Name: imputePCA
### Title: Impute dataset with PCA
### Aliases: imputePCA
### Keywords: models multivariate

### ** Examples

## Not run: 
##D data(orange)
##D ## First the number of components has to be chosen 
##D ##   (for the imputation step)
##D ## nb <- estim_ncpPCA(orange,ncp.max=5) ## Time consuming, nb = 2
##D 
##D ## Imputation
##D res.comp <- imputePCA(orange,ncp=2)
##D 
##D ## A PCA can be performed on the imputed data 
##D res.pca <- PCA(res.comp$completeObs)
## End(Not run)



