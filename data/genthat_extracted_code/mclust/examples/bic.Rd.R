library(mclust)


### Name: bic
### Title: BIC for Parameterized Gaussian Mixture Models
### Aliases: bic
### Keywords: cluster

### ** Examples

## Not run: 
##D n <- nrow(iris)
##D d <- ncol(iris)-1
##D G <- 3
##D 
##D emEst <- me(modelName="VVI", data=iris[,-5], unmap(iris[,5]))
##D names(emEst)
##D 
##D args(bic)
##D bic(modelName="VVI", loglik=emEst$loglik, n=n, d=d, G=G)
##D # do.call("bic", emEst)    ## alternative call
## End(Not run)



