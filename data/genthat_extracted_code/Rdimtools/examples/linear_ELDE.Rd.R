library(Rdimtools)


### Name: do.elde
### Title: Exponential Local Discriminant Embedding
### Aliases: do.elde

### ** Examples

## Not run: 
##D ## generate data of 3 types with difference
##D dt1  = aux.gensamples(n=33)-100
##D dt2  = aux.gensamples(n=33)
##D dt3  = aux.gensamples(n=33)+100
##D 
##D ## merge the data and create a label correspondingly
##D X      = rbind(dt1,dt2,dt3)
##D label  = c(rep(1,33), rep(2,33), rep(3,33))
##D 
##D ## try different kernel bandwidth
##D out1 = do.elde(X, label, t=1)
##D out2 = do.elde(X, label, t=10)
##D out3 = do.elde(X, label, t=100)
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="ELDE::bandwidth=1")
##D plot(out2$Y[,1], out2$Y[,2], main="ELDE::bandwidth=10")
##D plot(out3$Y[,1], out3$Y[,2], main="ELDE::bandwidth=100")
## End(Not run)




