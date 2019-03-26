library(Rdimtools)


### Name: do.lpp
### Title: Locality Preserving Projection
### Aliases: do.lpp

### ** Examples

## Not run: 
##D ## generate twinpeaks data
##D X <- aux.gensamples(dname="twinpeaks",n=100)
##D 
##D ## try different kernel bandwidths
##D out1 <- do.lpp(X, t=0.1)
##D out2 <- do.lpp(X, t=1)
##D out3 <- do.lpp(X, t=10)
##D 
##D ## Visualize three different projections
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1],out1$Y[,2],main="LPP::bandwidth=0.1")
##D plot(out2$Y[,1],out2$Y[,2],main="LPP::bandwidth=1")
##D plot(out3$Y[,1],out3$Y[,2],main="LPP::bandwidth=10")
## End(Not run)





