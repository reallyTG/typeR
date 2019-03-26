library(Rdimtools)


### Name: do.extlpp
### Title: Extended Locality Preserving Projection
### Aliases: do.extlpp

### ** Examples

## Not run: 
##D ## generate data
##D X <- aux.gensamples(n=123)
##D 
##D ## run Extended LPP with different neighborhood graph
##D out1 <- do.extlpp(X, numk=5)
##D out2 <- do.extlpp(X, numk=10)
##D out3 <- do.extlpp(X, numk=25)
##D 
##D ## Visualize three different projections
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="k=5")
##D plot(out2$Y[,1], out2$Y[,2], main="k=10")
##D plot(out3$Y[,1], out3$Y[,2], main="k=25")
## End(Not run)




