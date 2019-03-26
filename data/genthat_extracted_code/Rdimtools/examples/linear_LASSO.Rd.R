library(Rdimtools)


### Name: do.lasso
### Title: Least Absolute Shrinkage and Selection Operator
### Aliases: do.lasso

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
##D ## try different regularization parameters
##D out1 = do.lasso(X, y, lambda=0.1)
##D out2 = do.lasso(X, y, lambda=1)
##D out3 = do.lasso(X, y, lambda=10)
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="LASSO::lambda=0.1")
##D plot(out2$Y[,1], out2$Y[,2], main="LASSO::lambda=1")
##D plot(out3$Y[,1], out3$Y[,2], main="LASSO::lambda=10")
## End(Not run)




