library(Rdimtools)


### Name: do.lsir
### Title: Localized Sliced Inverse Regression
### Aliases: do.lsir

### ** Examples

## Not run: 
##D ## generate swiss roll with auxiliary dimensions
##D ## it follows reference example from LSIR paper.
##D n = 123
##D theta = runif(n)
##D h     = runif(n)
##D t     = (1+2*theta)*(3*pi/2)
##D X     = array(0,c(n,10))
##D X[,1] = t*cos(t)
##D X[,2] = 21*h
##D X[,3] = t*sin(t)
##D X[,4:10] = matrix(runif(7*n), nrow=n)
##D 
##D ## corresponding response vector
##D y = sin(5*pi*theta)+(runif(n)*sqrt(0.1))
##D 
##D ## try different number of neighborhoods
##D out1 = do.lsir(X, y, numk=5)
##D out2 = do.lsir(X, y, numk=10)
##D out3 = do.lsir(X, y, numk=25)
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="LSIR::nbd size=5")
##D plot(out2$Y[,1], out2$Y[,2], main="LSIR::nbd size=10")
##D plot(out3$Y[,1], out3$Y[,2], main="LSIR::nbd size=25")
## End(Not run)




