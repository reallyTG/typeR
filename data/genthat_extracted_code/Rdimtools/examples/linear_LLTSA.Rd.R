library(Rdimtools)


### Name: do.lltsa
### Title: Linear Local Tangent Space Alignment
### Aliases: do.lltsa

### ** Examples

## Not run: 
##D ## generate data
##D X <- aux.gensamples()
##D 
##D ## try different neighborhood size
##D out1 <- do.lltsa(X, type=c("proportion",0.01))
##D out2 <- do.lltsa(X, type=c("proportion",0.05))
##D out3 <- do.lltsa(X, type=c("proportion",0.10))
##D 
##D ## Visualize three different projections
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1],out1$Y[,2],main="LLTSA::1% connected")
##D plot(out2$Y[,1],out2$Y[,2],main="LLTSA::5% connected")
##D plot(out3$Y[,1],out3$Y[,2],main="LLTSA::10% connected")
## End(Not run)




