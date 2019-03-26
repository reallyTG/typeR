library(Rdimtools)


### Name: do.lmds
### Title: Landmark Multidimensional Scaling
### Aliases: do.lmds

### ** Examples

## Not run: 
##D # generate data
##D X <- aux.gensamples(dname="crown")
##D 
##D ## 1. use 10% of random points
##D output1 <- do.lmds(X,ndim=2,npoints=round(nrow(X)/10))
##D 
##D ## 2. using MaxMin scheme
##D output2 <- do.lmds(X,ndim=2,npoints=round(nrow(X)/10),ltype="MaxMin")
##D 
##D ## 3. original mds case
##D output3 <- do.mds(X,ndim=2)
##D 
##D ## Visualization
##D par(mfrow=c(1,3))
##D plot(output1$Y[,1],output2$Y[,2],main="10% random points")
##D plot(output2$Y[,1],output2$Y[,2],main="10% MaxMin points")
##D plot(output3$Y[,1],output3$Y[,2],main="original MDS")
## End(Not run)




