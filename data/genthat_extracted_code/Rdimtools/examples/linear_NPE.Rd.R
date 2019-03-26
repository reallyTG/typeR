library(Rdimtools)


### Name: do.npe
### Title: Neighborhood Preserving Embedding
### Aliases: do.npe

### ** Examples

## Not run: 
##D ## generate data
##D X <- aux.gensamples(n=333)
##D 
##D ## 1. connecting 5% of data for graph construction.
##D output1 <- do.npe(X,ndim=2,type=c("proportion",0.05))
##D 
##D ## 2. constructing 25%-connected graph with regularization parameter
##D output2 <- do.npe(X,ndim=2,type=c("proportion",0.2),symmetric='intersect',regparam=1.0)
##D 
##D ## 3. constructing half-connected graph with reg parameter = 10.0.
##D output3 <- do.npe(X,ndim=2,type=c("proportion",0.5),regparam=10.0)
##D 
##D ## Visualize three different projections
##D par(mfrow=c(1,3))
##D plot(output1$Y[,1],output1$Y[,2],main="5%")
##D plot(output2$Y[,1],output2$Y[,2],main="25%")
##D plot(output3$Y[,1],output3$Y[,2],main="50%")
## End(Not run)




