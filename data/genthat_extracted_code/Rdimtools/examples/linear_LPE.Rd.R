library(Rdimtools)


### Name: do.lpe
### Title: Locality Pursuit Embedding
### Aliases: do.lpe

### ** Examples

## Not run: 
##D ## generate swiss roll with auxiliary dimensions
##D n = 100
##D theta = runif(n)
##D h     = runif(n)
##D t     = (1+2*theta)*(3*pi/2)
##D X     = array(0,c(n,10))
##D X[,1] = t*cos(t)
##D X[,2] = 21*h
##D X[,3] = t*sin(t)
##D X[,4:10] = matrix(runif(7*n), nrow=n)
##D 
##D ## try with different neighborhood sizes
##D out1 = do.lpe(X, numk=5)
##D out2 = do.lpe(X, numk=10)
##D out3 = do.lpe(X, numk=25)
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="LPE::numk=5")
##D plot(out2$Y[,1], out2$Y[,2], main="LPE::numk=10")
##D plot(out3$Y[,1], out3$Y[,2], main="LPE::numk=25")
## End(Not run)




