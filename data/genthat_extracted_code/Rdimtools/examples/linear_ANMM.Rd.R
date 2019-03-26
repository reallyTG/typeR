library(Rdimtools)


### Name: do.anmm
### Title: Average Neighborhood Margin Maximization
### Aliases: do.anmm

### ** Examples

## Not run: 
##D ## generate 3 different groups of data X and label vector
##D x1 = matrix(rnorm(4*10), nrow=10)-20
##D x2 = matrix(rnorm(4*10), nrow=10)
##D x3 = matrix(rnorm(4*10), nrow=10)+20
##D X  = rbind(x1, x2, x3)
##D label = c(rep(1,10), rep(2,10), rep(3,10))
##D 
##D ## perform ANMM on different choices of neighborhood size
##D out1 = do.anmm(X, label, No=6, Ne=6)
##D out2 = do.anmm(X, label, No=2, Ne=10)
##D out3 = do.anmm(X, label, No=10,Ne=2)
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="(No,Ne)=(6,6)")
##D plot(out2$Y[,1], out2$Y[,2], main="(No,Ne)=(2,10)")
##D plot(out3$Y[,1], out3$Y[,2], main="(No,Ne)=(10,2)")
## End(Not run)





