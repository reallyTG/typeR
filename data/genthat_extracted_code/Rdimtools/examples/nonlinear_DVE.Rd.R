library(Rdimtools)


### Name: do.dve
### Title: Distinguishing Variance Embedding
### Aliases: do.dve

### ** Examples

## Not run: 
##D ## generate swiss-roll dataset of size 200
##D X <- aux.gensamples(dname="crown",n=200)
##D 
##D ## try different nbd size
##D out1 <- do.dve(X, type=c("proportion",0.4))
##D out2 <- do.dve(X, type=c("proportion",0.6))
##D out3 <- do.dve(X, type=c("proportion",0.8))
##D 
##D ## Visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1],out1$Y[,2],main="DVE::20% connected")
##D plot(out2$Y[,1],out2$Y[,2],main="DVE::50% connected")
##D plot(out3$Y[,1],out3$Y[,2],main="DVE::80% connected")
## End(Not run)




