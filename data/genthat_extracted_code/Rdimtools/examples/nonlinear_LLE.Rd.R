library(Rdimtools)


### Name: do.lle
### Title: Locally Linear Embedding
### Aliases: do.lle

### ** Examples

## Not run: 
##D ## Generate Data
##D X = aux.gensamples(n=100)
##D 
##D ## 1. connecting 10% of data for graph construction.
##D output1 <- do.lle(X,ndim=2,type=c("proportion",0.10))
##D 
##D ## 2. constructing 20%-connected graph
##D output2 <- do.lle(X,ndim=2,type=c("proportion",0.20))
##D 
##D ## 3. constructing 50%-connected with bigger regularization parameter
##D output3 <- do.lle(X,ndim=2,type=c("proportion",0.5),regparam=10)
##D 
##D ## Visualize three different projections
##D par(mfrow=c(1,3))
##D plot(output1$Y[,1],output1$Y[,2],main="5%")
##D plot(output2$Y[,1],output2$Y[,2],main="10%")
##D plot(output3$Y[,1],output3$Y[,2],main="50%+Binary")
## End(Not run)




