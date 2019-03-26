library(Rdimtools)


### Name: do.ispe
### Title: Isometric Stochastic Proximity Embedding
### Aliases: do.ispe

### ** Examples

## Not run: 
##D ## generate sample data
##D X = aux.gensamples(n=100)
##D 
##D ## compare with original SPE
##D outSPE <- do.spe(X, ndim=2)
##D out1 <- do.ispe(X, ndim=2, cutoff=0.5)
##D out2 <- do.ispe(X, ndim=2, cutoff=5)
##D out3 <- do.ispe(X, ndim=2, cutoff=50)
##D 
##D ## Visualize
##D par(mfrow=c(2,2))
##D plot(outSPE$Y[,1], outSPE$Y[,2], main="SPE")
##D plot(out1$Y[,1], out1$Y[,2], main="ISPE::cutoff=0.5")
##D plot(out2$Y[,1], out2$Y[,2], main="ISPE::cutoff=5")
##D plot(out3$Y[,1], out3$Y[,2], main="ISPE::cutoff=50")
## End(Not run)




