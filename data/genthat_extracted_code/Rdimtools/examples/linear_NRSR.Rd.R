library(Rdimtools)


### Name: do.nrsr
### Title: Non-convex Regularized Self-Representation
### Aliases: do.nrsr

### ** Examples

## Not run: 
##D #### generate R12in72 dataset
##D X = aux.gensamples(n=100, dname="R12in72")
##D 
##D #### try different exponents for regularization
##D out1 = do.nrsr(X, expl=0.01)
##D out2 = do.nrsr(X, expl=0.1)
##D out3 = do.nrsr(X, expl=0.5)
##D 
##D #### visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="NRSR::expl=0.01")
##D plot(out2$Y[,1], out2$Y[,2], main="NRSR::expl=0.1")
##D plot(out3$Y[,1], out3$Y[,2], main="NRSR::expl=0.5")
## End(Not run)




