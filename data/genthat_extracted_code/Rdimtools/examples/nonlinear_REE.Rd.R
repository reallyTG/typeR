library(Rdimtools)


### Name: do.ree
### Title: Robust Euclidean Embedding
### Aliases: do.ree

### ** Examples

## Not run: 
##D ## generate swiss roll data
##D X = aux.gensamples(n=123)
##D 
##D ## 1. no preprocessing
##D output1 <- do.ree(X,ndim=2,maxiter=50)
##D 
##D ## 2. use decorrelated data
##D output2 <- do.ree(X,ndim=2,preprocess="decorrelate",maxiter=50)
##D 
##D ## Visualize three different projections
##D par(mfrow=c(1,2))
##D plot(output1$Y[,1],output1$Y[,2],main="centered")
##D plot(output2$Y[,1],output2$Y[,2],main="decorrelated")
## End(Not run)




