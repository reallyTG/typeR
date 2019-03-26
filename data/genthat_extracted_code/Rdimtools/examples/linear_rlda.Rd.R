library(Rdimtools)


### Name: do.rlda
### Title: Regularized Linear Discriminant Analysis
### Aliases: do.rlda

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
##D ## try different regularization parameters
##D out1 <- do.rlda(Y, label, alpha=0.1)
##D out2 <- do.rlda(Y, label, alpha=1)
##D out3 <- do.rlda(Y, label, alpha=10)
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="alpha=0.1")
##D plot(out2$Y[,1], out2$Y[,2], main="alpha=1")
##D plot(out3$Y[,1], out3$Y[,2], main="alpha=10")
## End(Not run)




