library(missMDA)


### Name: imputeMCA
### Title: Impute categorical dataset
### Aliases: imputeMCA
### Keywords: models multivariate

### ** Examples

## Not run: 
##D data(vnf)
##D ## First the number of components has to be chosen 
##D ##   (for the reconstruction step)
##D ## nb <- estim_ncpMCA(vnf,ncp.max=5) ## Time-consuming, nb = 4
##D 
##D ## Impute the indicator matrix and perform a MCA
##D res.impute <- imputeMCA(vnf, ncp=4)
##D 
##D ## The imputed indicator matrix can be used as an input of the MCA function of the
##D ## FactoMineR package to perform the MCA on the incomplete data vnf 
##D res.mca <- MCA(vnf,tab.disj=res.impute$tab.disj) 
##D 
##D ## With supplementary variables (var 11 to 14), impute the active ones
##D res.impute <- imputeMCA(vnf[,1:10], ncp=4)
##D res.mca <- MCA(vnf,tab.disj=res.impute$tab.disj,quali.sup=11:14) 
## End(Not run)



