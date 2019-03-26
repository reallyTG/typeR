library(Rdimtools)


### Name: do.asi
### Title: Adaptive Subspace Iteration
### Aliases: do.asi

### ** Examples

## Not run: 
##D ## generate swiss roll data
##D X = aux.gensamples(n=123)
##D 
##D ## try different tolerance level
##D out1 = do.asi(X, abstol=1e-2)
##D out2 = do.asi(X, abstol=1e-3)
##D out3 = do.asi(X, abstol=1e-4)
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="ASI::tol=1e-2")
##D plot(out2$Y[,1], out2$Y[,2], main="ASI::tol=1e-3")
##D plot(out3$Y[,1], out3$Y[,2], main="ASI::tol=1e-4")
## End(Not run)




