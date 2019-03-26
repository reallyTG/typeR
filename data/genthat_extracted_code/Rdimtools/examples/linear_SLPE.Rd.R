library(Rdimtools)


### Name: do.slpe
### Title: Supervised Locality Pursuit Embedding
### Aliases: do.slpe

### ** Examples

## Not run: 
##D ## generate data of 2 types with clear difference
##D diff = 15
##D dt1  = aux.gensamples(n=123)-diff;
##D dt2  = aux.gensamples(n=123)+diff;
##D 
##D ## merge the data and create a label correspondingly
##D X      = rbind(dt1,dt2)
##D label  = c(rep(1,123), rep(2,123))
##D 
##D ## compare SLPE with SLPP
##D out1 <- do.slpp(X, label)
##D out2 <- do.slpe(X, label)
##D 
##D ## visualize
##D par(mfrow=c(1,2))
##D plot(out1$Y[,1], out1$Y[,2], main="SLPP")
##D plot(out2$Y[,1], out2$Y[,2], main="SLPE")
## End(Not run)




