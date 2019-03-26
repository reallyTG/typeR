library(Rdimtools)


### Name: do.llle
### Title: Local Linear Laplacian Eigenmaps
### Aliases: do.llle

### ** Examples

## Not run: 
##D ## generate 12-dim data embedded in 72-dim.
##D X = aux.gensamples(n=200, dname="R12in72")
##D 
##D # see the effect bandwidth
##D out1 = do.llle(X, bandwidth=0.1)
##D out2 = do.llle(X, bandwidth=0.5)
##D out3 = do.llle(X, bandwidth=0.9)
##D 
##D # visualize the results
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1],out1$Y[,2],main="bandwidth=0.1")
##D plot(out2$Y[,1],out2$Y[,2],main="bandwidth=0.5")
##D plot(out3$Y[,1],out3$Y[,2],main="bandwidth=0.9")
## End(Not run)




