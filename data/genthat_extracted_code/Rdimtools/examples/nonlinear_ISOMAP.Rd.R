library(Rdimtools)


### Name: do.isomap
### Title: Isometric Feature Mapping
### Aliases: do.isomap

### ** Examples

## Not run: 
##D ## generate data
##D X <- aux.gensamples(n=123)
##D 
##D ## 1. connecting 10% of data for graph construction.
##D output1 <- do.isomap(X,ndim=2,type=c("proportion",0.10))
##D 
##D ## 2. constructing 25%-connected graph
##D output2 <- do.isomap(X,ndim=2,type=c("proportion",0.25))
##D 
##D ## 3. constructing 25%-connected with binarization
##D output3 <- do.isomap(X,ndim=2,type=c("proportion",0.25),weight=FALSE)
##D 
##D ## Visualize three different projections
##D par(mfrow=c(1,3))
##D plot(output1$Y[,1],output1$Y[,2],main="10%")
##D plot(output2$Y[,1],output2$Y[,2],main="25%")
##D plot(output3$Y[,1],output3$Y[,2],main="25%+Binary")
## End(Not run)





