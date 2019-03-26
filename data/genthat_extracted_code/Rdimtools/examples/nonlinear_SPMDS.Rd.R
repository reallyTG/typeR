library(Rdimtools)


### Name: do.spmds
### Title: Spectral Multidimensional Scaling
### Aliases: do.spmds

### ** Examples

## Not run: 
##D ## Replicate the numerical example from the paper
##D #  Data Preparation
##D dim.true  = 3     # true dimension
##D dim.embed = 100   # embedding space (high-d)
##D npoints   = 1000  # number of samples to be generated
##D 
##D v     = matrix(runif(dim.embed*dim.true),ncol=dim.embed)
##D coeff = matrix(runif(dim.true*npoints),  ncol=dim.true)
##D X     = coeff%*%v
##D 
##D # see the effect of neighborhood size
##D out1  = do.spmds(X, neigs=100, type=c("proportion",0.1))
##D out2  = do.spmds(X, neigs=100, type=c("proportion",0.25))
##D out3  = do.spmds(X, neigs=100, type=c("proportion",0.50))
##D 
##D # visualize the results
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1],out1$Y[,2],main="10% neighborhood")
##D plot(out2$Y[,1],out2$Y[,2],main="25% neighborhood")
##D plot(out3$Y[,1],out3$Y[,2],main="50% neighborhood")
## End(Not run)




