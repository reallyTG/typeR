library(Rdimtools)


### Name: do.lea
### Title: Locally Linear Embedded Eigenspace Analysis
### Aliases: do.lea

### ** Examples

## Not run: 
##D ## generate samples
##D X <- aux.gensamples(n=123)
##D 
##D ## compare LEA with LLE and another approximation NPE
##D out1 <- do.lle(X, ndim=2)
##D out2 <- do.npe(X, ndim=2)
##D out3 <- do.lea(X, ndim=2)
##D 
##D ## visual comparison
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="LLE")
##D plot(out2$Y[,1], out2$Y[,2], main="NPE")
##D plot(out3$Y[,1], out3$Y[,2], main="LEA")
## End(Not run)




