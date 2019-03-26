library(Rdimtools)


### Name: do.udp
### Title: Unsupervised Discriminant Projection
### Aliases: do.udp

### ** Examples

## Not run: 
##D ## generate sample data
##D X = aux.gensamples(n=200)
##D 
##D ## use different connectivity level
##D out1 <- do.udp(X, type=c("proportion",0.05))
##D out2 <- do.udp(X, type=c("proportion",0.10))
##D out3 <- do.udp(X, type=c("proportion",0.25))
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1],out1$Y[,2],main="connectivity 5%")
##D plot(out2$Y[,1],out2$Y[,2],main="connectivity 10%")
##D plot(out3$Y[,1],out3$Y[,2],main="connectivity 25%")
## End(Not run)




