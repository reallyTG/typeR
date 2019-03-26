library(Rdimtools)


### Name: do.sir
### Title: Sliced Inverse Regression
### Aliases: do.sir

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
##D ## try with different numbers of slices
##D out1 = do.sir(X, y, h=2)
##D out2 = do.sir(X, y, h=5)
##D out3 = do.sir(X, y, h=10)
##D 
##D ## visualize
##D par(mfrow=c(1,3))
##D plot(out1$Y[,1], out1$Y[,2], main="SIR::2 slices")
##D plot(out2$Y[,1], out2$Y[,2], main="SIR::5 slices")
##D plot(out3$Y[,1], out3$Y[,2], main="SIR::10 slices")
## End(Not run)




