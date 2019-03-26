library(Rdimtools)


### Name: do.sne
### Title: Stochastic Neighbor Embedding
### Aliases: do.sne

### ** Examples

## Not run: 
##D ## generate ribbon-shaped data
##D ## in order to pass CRAN pretest, n is set to be small.
##D X = aux.gensamples(dname="ribbon",n=99)
##D 
##D ## 1. pca scaling with 90% variances explained
##D output1 <- do.sne(X,ndim=2,pca=TRUE)
##D 
##D ## 2. pca scaling wiht 50% variances explained
##D output2 <- do.sne(X,ndim=2,pca=TRUE,pcaratio=0.50)
##D 
##D ## 3. Setting 2 + smaller level of perplexity
##D output3 <- do.sne(X,ndim=2,pca=TRUE,pcaratio=0.50,perplexity=10)
##D 
##D ## Visualize three different projections
##D par(mfrow=c(1,3))
##D if ((length(output1)!=1)&&(!is.na(output1))){plot(output1$Y[,1],output1$Y[,2],main="Setting 1")}
##D if ((length(output1)!=1)&&(!is.na(output2))){plot(output2$Y[,1],output2$Y[,2],main="Setting 2")}
##D if ((length(output1)!=1)&&(!is.na(output3))){plot(output3$Y[,1],output3$Y[,2],main="Setting 3")}
## End(Not run)




