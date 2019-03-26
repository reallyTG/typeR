library(adegenet)


### Name: glPca
### Title: Principal Component Analysis for genlight objects
### Aliases: glPca print.glPca scatter.glPca loadingplot.glPca
### Keywords: multivariate

### ** Examples

## Not run: 
##D ## simulate a toy dataset
##D x <- glSim(50,4e3, 50, ploidy=2)
##D x
##D plot(x)
##D 
##D ## perform PCA
##D pca1 <- glPca(x, nf=2)
##D 
##D ## plot eigenvalues
##D barplot(pca1$eig, main="eigenvalues", col=heat.colors(length(pca1$eig)))
##D 
##D ## basic plot
##D scatter(pca1, ratio=.2)
##D 
##D ## plot showing groups
##D s.class(pca1$scores, pop(x), col=colors()[c(131,134)])
##D add.scatter.eig(pca1$eig,2,1,2)
## End(Not run)



