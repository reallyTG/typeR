library(Rdimtools)


### Name: do.adr
### Title: Adaptive Dimension Reduction
### Aliases: do.adr

### ** Examples

## Not run: 
##D ## load iris data
##D data(iris)
##D X = as.matrix(iris[,1:4])
##D 
##D ## try different tolerance level
##D out1 = do.adr(X, abstol=1e-2)
##D out2 = do.adr(X, abstol=1e-3)
##D out3 = do.adr(X, abstol=1e-4)
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="ADR::tol=1e-2")
##D plot(out2$Y[,1], out2$Y[,2], main="ADR::tol=1e-3")
##D plot(out3$Y[,1], out3$Y[,2], main="ADR::tol=1e-4")
## End(Not run)




