library(Rdimtools)


### Name: do.dspp
### Title: Discriminative Sparsity Preserving Projection
### Aliases: do.dspp

### ** Examples

## Not run: 
##D ## generate data of 2 types with clear difference
##D diff = 15
##D dt1  = aux.gensamples(n=123)-diff;
##D dt2  = aux.gensamples(n=123)+diff;
##D 
##D ## merge the data and create a label correspondingly
##D Y      = rbind(dt1,dt2)
##D label  = c(rep(1,123), rep(2,123))
##D 
##D ## try different rho values
##D out1 <- do.dspp(Y, label, ndim=2, rho=0.01)
##D out2 <- do.dspp(Y, label, ndim=2, rho=0.1)
##D out3 <- do.dspp(Y, label, ndim=2, rho=1)
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="rho=0.01")
##D plot(out2$Y[,1], out2$Y[,2], main="rho=0.1")
##D plot(out3$Y[,1], out3$Y[,2], main="rho=1")
## End(Not run)




