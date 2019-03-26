library(Rdimtools)


### Name: do.ppca
### Title: Probabilistic Principal Component Analysis
### Aliases: do.ppca

### ** Examples

## Not run: 
##D ## generate data
##D X <- aux.gensamples(n=496)
##D 
##D ## Compare PCA and PPCA
##D PCA  <- do.pca(X, ndim=2, preprocess="center")
##D PPCA <- do.ppca(X, ndim=2, preprocess="center")
##D 
##D ## Visualize
##D par(mfrow=c(1,2))
##D plot(PCA$Y[,1], PCA$Y[,2], main="PCA")
##D plot(PPCA$Y[,1], PPCA$Y[,2], main="PPCA")
## End(Not run)




