library(Rdimtools)


### Name: do.dagdne
### Title: Double-Adjacency Graphs-based Discriminant Neighborhood
###   Embedding
### Aliases: do.dagdne

### ** Examples

## Not run: 
##D ## generate data of 3 types with clear difference
##D dt1  = aux.gensamples(n=33)-100
##D dt2  = aux.gensamples(n=33)
##D dt3  = aux.gensamples(n=33)+100
##D 
##D ## merge the data and create a label correspondingly
##D Y      = rbind(dt1,dt2,dt3)
##D label  = c(rep(1,33), rep(2,33), rep(3,33))
##D 
##D ## try different numbers for neighborhood size
##D out1 = do.dagdne(Y, label, numk=5)
##D out2 = do.dagdne(Y, label, numk=10)
##D out3 = do.dagdne(Y, label, numk=25)
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="nbd size=5")
##D plot(out2$Y[,1], out2$Y[,2], main="nbd size=10")
##D plot(out3$Y[,1], out3$Y[,2], main="nbd size=25")
## End(Not run)




