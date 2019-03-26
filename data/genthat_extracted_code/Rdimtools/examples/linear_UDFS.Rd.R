library(Rdimtools)


### Name: do.udfs
### Title: Unsupervised Discriminative Features Selection
### Aliases: do.udfs

### ** Examples

## Not run: 
##D #### generate R12in72 dataset
##D X = aux.gensamples(n=50, dname="R12in72")
##D 
##D #### try different neighborhood size
##D out1 = do.udfs(X, k=5)
##D out2 = do.udfs(X, k=10)
##D out3 = do.udfs(X, k=25)
##D 
##D #### visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="UDFS::k=5")
##D plot(out2$Y[,1], out2$Y[,2], main="UDFS::k=10")
##D plot(out3$Y[,1], out3$Y[,2], main="UDFS::k=25")
## End(Not run)




