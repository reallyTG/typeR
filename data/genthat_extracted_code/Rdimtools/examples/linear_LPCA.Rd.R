library(Rdimtools)


### Name: do.lpca
### Title: Locally Principal Component Analysis
### Aliases: do.lpca

### ** Examples

## Not run: 
##D ## generate default dataset
##D X <- aux.gensamples()
##D 
##D ## try different neighborhood size
##D out1 <- do.lpca(X, ndim=2, type=c("proportion",0.01))
##D out2 <- do.lpca(X, ndim=2, type=c("proportion",0.1))
##D out3 <- do.lpca(X, ndim=2, type=c("proportion",0.25))
##D 
##D ## Visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1],out1$Y[,2],main="1% connected")
##D plot(out2$Y[,1],out2$Y[,2],main="10% connected")
##D plot(out3$Y[,1],out3$Y[,2],main="25% connected")
## End(Not run)




