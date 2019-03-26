library(Rdimtools)


### Name: do.disr
### Title: Diversity-Induced Self-Representation
### Aliases: do.disr

### ** Examples

## Not run: 
##D #### generate R12in72 dataset
##D X = aux.gensamples(dname="R12in72")
##D 
##D #### try different lbd combinations
##D out1 = do.disr(X, lbd1=1, lbd2=1)
##D out2 = do.disr(X, lbd1=1, lbd2=5)
##D out3 = do.disr(X, lbd1=5, lbd2=1)
##D out4 = do.disr(X, lbd1=5, lbd2=5)
##D 
##D #### visualize
##D par(mfrow=c(2,2))
##D plot(out1$Y[,1], out1$Y[,2], main="(lbd1,lbd2)=(1,1)")
##D plot(out2$Y[,1], out2$Y[,2], main="(lbd1,lbd2)=(1,5)")
##D plot(out3$Y[,1], out3$Y[,2], main="(lbd1,lbd2)=(5,1)")
##D plot(out4$Y[,1], out4$Y[,2], main="(lbd1,lbd2)=(5,5)")
## End(Not run)




