library(Rdimtools)


### Name: do.kmfa
### Title: Kernel Marginal Fisher Analysis
### Aliases: do.kmfa

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
##D ## try different numbers for neighborhood size
##D out1 = do.kmfa(X, label, k1=5, k2=5, t=1)
##D out2 = do.kmfa(X, label, k1=5, k2=5, t=2)
##D 
##D ## visualize
##D par(mfrow=c(1,2))
##D plot(out1$Y[,1], out1$Y[,2], main="bandwidth=1")
##D plot(out2$Y[,1], out2$Y[,2], main="bandwidth=2")
## End(Not run)



