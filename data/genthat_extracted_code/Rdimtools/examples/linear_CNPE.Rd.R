library(Rdimtools)


### Name: do.cnpe
### Title: Complete Neighborhood Preserving Embedding
### Aliases: do.cnpe

### ** Examples

## Not run: 
##D ## generate data of 3 types with clear difference
##D dt1  = aux.gensamples(n=33)-50
##D dt2  = aux.gensamples(n=33)
##D dt3  = aux.gensamples(n=33)+50
##D 
##D ## merge the data
##D X      = rbind(dt1,dt2,dt3)
##D 
##D ## try different numbers for neighborhood size
##D out1 = do.cnpe(X, type=c("proportion",0.05))
##D out2 = do.cnpe(X, type=c("proportion",0.1))
##D out3 = do.cnpe(X, type=c("proportion",0.25))
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="CNPE::5% connectivity")
##D plot(out2$Y[,1], out2$Y[,2], main="CNPE::10% connectivity")
##D plot(out3$Y[,1], out3$Y[,2], main="CNPE::25% connectivity")
## End(Not run)




