library(Rdimtools)


### Name: do.rsir
### Title: Regularized Sliced Inverse Regression
### Aliases: do.rsir

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
##D ## try with different regularization methods
##D ## use default number of slices
##D out1 = do.rsir(X, y, regmethod="Ridge")
##D out2 = do.rsir(X, y, regmethod="Tikhonov")
##D out3 = do.rsir(X, y, regmethod="PCA")
##D out4 = do.rsir(X, y, regmethod="PCARidge")
##D out5 = do.rsir(X, y, regmethod="PCATikhonov")
##D outsir = do.sir(X, y)
##D 
##D ## visualize
##D par(mfrow=c(2,3))
##D plot(out1$Y[,1], out1$Y[,2], main="RSIR::Ridge")
##D plot(out2$Y[,1], out2$Y[,2], main="RSIR::Tikhonov")
##D plot(out3$Y[,1], out3$Y[,2], main="RSIR::PCA")
##D plot(out4$Y[,1], out4$Y[,2], main="RSIR::PCA+Ridge")
##D plot(out5$Y[,1], out5$Y[,2], main="RSIR::PCA+Tikhonov")
##D plot(outsir$Y[,1], outsir$Y[,2], main="standard SIR")
## End(Not run)




