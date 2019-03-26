library(missMDA)


### Name: orange
### Title: Sensory description of 12 orange juices by 8 attributes.
### Aliases: orange
### Keywords: datasets

### ** Examples

## Not run: 
##D data(orange)
##D nb <- estim_ncpPCA(orange,ncp.min=0,ncp.max=5,method.cv="Kfold",nbsim=20,pNA=0.05)
##D res.comp <- imputePCA(orange,ncp=nb$ncp)
##D require(FactoMineR)
##D res.pca <- PCA(res.comp$completeObs)
##D resMI <- MIPCA(orange,ncp=nb$ncp)
##D plot(resMI)
## End(Not run)



