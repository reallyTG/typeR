library(Rdimtools)


### Name: do.klde
### Title: Kernel Local Discriminant Embedding
### Aliases: do.klde

### ** Examples

## Not run: 
##D ## generate data of 2 types with clear difference
##D diff = 5
##D dt1  = aux.gensamples(n=123)-diff;
##D dt2  = aux.gensamples(n=123)+diff;
##D 
##D ## merge the data and create a label correspondingly
##D Y      = rbind(dt1,dt2)
##D label  = c(rep(1,123), rep(2,123))
##D 
##D ## try different neighborhood size
##D out1 <- do.klde(Y, label, kcentering=TRUE, numk=5)
##D out2 <- do.klde(Y, label, numk=10)
##D out3 <- do.klde(Y, label, numk=25)
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="k=5")
##D plot(out2$Y[,1], out2$Y[,2], main="k=10")
##D plot(out3$Y[,1], out3$Y[,2], main="k=25")
## End(Not run)




