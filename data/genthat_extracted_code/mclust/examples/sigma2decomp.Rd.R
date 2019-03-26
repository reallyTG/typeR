library(mclust)


### Name: sigma2decomp
### Title: Convert mixture component covariances to decomposition form.
### Aliases: sigma2decomp
### Keywords: cluster

### ** Examples

meEst <- meEEE(iris[,-5], unmap(iris[,5])) 
names(meEst$parameters$variance)
meEst$parameters$variance$Sigma

sigma2decomp(meEst$parameters$variance$Sigma, G = length(unique(iris[,5])))



