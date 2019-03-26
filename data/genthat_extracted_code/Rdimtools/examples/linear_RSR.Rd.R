library(Rdimtools)


### Name: do.rsr
### Title: Regularized Self-Representation
### Aliases: do.rsr

### ** Examples

## Not run: 
##D #### generate R12in72 dataset
##D X = aux.gensamples(n=100, dname="R12in72")
##D 
##D #### try different lbd combinations
##D out1 = do.rsr(X, lbd=0.1)
##D out2 = do.rsr(X, lbd=1)
##D out3 = do.rsr(X, lbd=10)
##D 
##D #### visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="RSR::lbd=0.1")
##D plot(out2$Y[,1], out2$Y[,2], main="RSR::lbd=1")
##D plot(out3$Y[,1], out3$Y[,2], main="RSR::lbd=10")
## End(Not run)




