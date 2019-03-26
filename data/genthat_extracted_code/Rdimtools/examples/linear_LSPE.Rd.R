library(Rdimtools)


### Name: do.lspe
### Title: Locality and Similarity Preserving Embedding
### Aliases: do.lspe

### ** Examples

## Not run: 
##D #### generate R12in72 dataset
##D X = aux.gensamples(dname="R12in72")
##D 
##D #### try different bandwidth values
##D out1 = do.lspe(X, bandwidth=0.1)
##D out2 = do.lspe(X, bandwidth=1)
##D out3 = do.lspe(X, bandwidth=10)
##D 
##D #### visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="LSPE::bandwidth=0.1")
##D plot(out2$Y[,1], out2$Y[,2], main="LSPE::bandwidth=1")
##D plot(out3$Y[,1], out3$Y[,2], main="LSPE::bandwidth=10")
## End(Not run)




