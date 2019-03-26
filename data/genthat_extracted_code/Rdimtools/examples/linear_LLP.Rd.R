library(Rdimtools)


### Name: do.llp
### Title: Local Learning Projections
### Aliases: do.llp

### ** Examples

## Not run: 
##D ## generate data
##D X <- aux.gensamples(dname="crown")
##D 
##D ## test different lambda - regularization - values
##D out1 <- do.llp(X,ndim=2,lambda=0.1)
##D out2 <- do.llp(X,ndim=2,lambda=1)
##D out3 <- do.llp(X,ndim=2,lambda=10)
##D 
##D # visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="lambda = 0.1")
##D plot(out2$Y[,1], out2$Y[,2], main="lambda = 1")
##D plot(out3$Y[,1], out3$Y[,2], main="lambda = 10")
## End(Not run)




