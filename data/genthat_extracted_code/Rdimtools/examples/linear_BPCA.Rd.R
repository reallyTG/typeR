library(Rdimtools)


### Name: do.bpca
### Title: Bayesian Principal Component Analysis
### Aliases: do.bpca

### ** Examples

## Not run: 
##D ## generate swiss roll data
##D X = aux.gensamples()
##D 
##D ## Compare PCA and BPCA
##D out1  <- do.pca(X, ndim=2, preprocess="center")
##D out2  <- do.bpca(X, ndim=2, preprocess="center")
##D 
##D ## Visualize
##D par(mfrow=c(1,2))
##D plot(out1$Y[,1], out1$Y[,2], main="PCA")
##D plot(out2$Y[,1], out2$Y[,2], main="BPCA")
## End(Not run)




