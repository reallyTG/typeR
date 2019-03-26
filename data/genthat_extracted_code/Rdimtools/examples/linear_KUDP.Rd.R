library(Rdimtools)


### Name: do.kudp
### Title: Kernel-Weighted Unsupervised Discriminant Projection
### Aliases: do.kudp

### ** Examples

## Not run: 
##D ## generate sample data
##D X = aux.gensamples(n=200)
##D 
##D ## use different kernel bandwidth
##D out1 <- do.kudp(X, bandwidth=0.1)
##D out2 <- do.kudp(X, bandwidth=10)
##D out3 <- do.kudp(X, bandwidth=1000)
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1],out1$Y[,2],main="bandwidth=0.1")
##D plot(out2$Y[,1],out2$Y[,2],main="bandwidth=10")
##D plot(out3$Y[,1],out3$Y[,2],main="bandwidth=1000")
## End(Not run)




