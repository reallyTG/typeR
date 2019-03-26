library(Rdimtools)


### Name: do.dm
### Title: Diffusion Maps
### Aliases: do.dm

### ** Examples

## Not run: 
##D ## generate swiss roll data
##D X <- aux.gensamples(n=200)
##D 
##D ## compare different bandwidths
##D out1 <- do.dm(X,bandwidth=10)
##D out2 <- do.dm(X,bandwidth=100)
##D out3 <- do.dm(X,bandwidth=1000)
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1],out1$Y[,2],main="DM::bandwidth=10")
##D plot(out2$Y[,1],out2$Y[,2],main="DM::bandwidth=100")
##D plot(out3$Y[,1],out3$Y[,2],main="DM::bandwidth=1000")
## End(Not run)




