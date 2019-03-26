library(Rdimtools)


### Name: do.lpfda
### Title: Locality Preserving Fisher Discriminant Analysis
### Aliases: do.lpfda

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
##D ## try different proportion of connected edges
##D out1 = do.lpfda(X, label, type=c("proportion",0.01))
##D out2 = do.lpfda(X, label, type=c("proportion",0.1))
##D out3 = do.lpfda(X, label, type=c("proportion",0.25))
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="1% connectivity")
##D plot(out2$Y[,1], out2$Y[,2], main="10% connectivity")
##D plot(out3$Y[,1], out3$Y[,2], main="25% connectivity")
## End(Not run)




