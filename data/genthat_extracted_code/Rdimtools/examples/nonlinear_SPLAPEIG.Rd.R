library(Rdimtools)


### Name: do.splapeig
### Title: Supervised Laplacian Eigenmaps
### Aliases: do.splapeig

### ** Examples

## Not run: 
##D ## generate data of 3 types with clear difference
##D dt1  = aux.gensamples(n=33)-100
##D dt2  = aux.gensamples(n=33)
##D dt3  = aux.gensamples(n=33)+100
##D 
##D ## merge the data and create a label correspondingly
##D X      = rbind(dt1,dt2,dt3)
##D label  = c(rep(1,33), rep(2,33), rep(3,33))
##D 
##D ## try different balancing parameters with beta=100
##D out1 = do.splapeig(X, label, beta=100, gamma=0.1)
##D out2 = do.splapeig(X, label, beta=100, gamma=0.5)
##D out3 = do.splapeig(X, label, beta=100, gamma=0.9)
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="gamma=0.1")
##D plot(out2$Y[,1], out2$Y[,2], main="gamma=0.5")
##D plot(out3$Y[,1], out3$Y[,2], main="gamma=0.9")
## End(Not run)





