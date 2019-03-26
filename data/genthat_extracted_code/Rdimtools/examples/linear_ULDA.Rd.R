library(Rdimtools)


### Name: do.ulda
### Title: Uncorrelated Linear Discriminant Analysis
### Aliases: do.ulda

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
##D ## compare with LDA
##D out1 = do.lda(X, label)
##D out2 = do.ulda(X, label)
##D 
##D ## visualize
##D par(mfrow=c(1,2))
##D plot(out1$Y[,1], out1$Y[,2], main="LDA")
##D plot(out2$Y[,1], out2$Y[,2], main="Uncorrelated LDA")
## End(Not run)




