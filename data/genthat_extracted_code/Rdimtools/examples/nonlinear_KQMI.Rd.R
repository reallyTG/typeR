library(Rdimtools)


### Name: do.kqmi
### Title: Kernel Quadratic Mutual Information
### Aliases: do.kqmi

### ** Examples

## Not run: 
##D ## generate 3 different groups of data X and label vector
##D x1 = matrix(rnorm(4*10), nrow=10)-20
##D x2 = matrix(rnorm(4*10), nrow=10)
##D x3 = matrix(rnorm(4*10), nrow=10)+20
##D X  = rbind(x1, x2, x3)
##D label = c(rep(1,10), rep(2,10), rep(3,10))
##D 
##D ## try different kernel bandwidths
##D out1 = do.kqmi(X, label, t=0.01)
##D out2 = do.kqmi(X, label, t=1)
##D out3 = do.kqmi(X, label, t=100)
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="KQMI::t=0.01")
##D plot(out2$Y[,1], out2$Y[,2], main="KQMI::t=1")
##D plot(out3$Y[,1], out3$Y[,2], main="KQMI::t=100")
## End(Not run)




