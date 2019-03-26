library(Rdimtools)


### Name: do.enet
### Title: Elastic Net Regularization
### Aliases: do.enet

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
##D out1 = do.enet(X, y, lambda1=0.1, lambda2=0.1)
##D out2 = do.enet(X, y, lambda1=1,   lambda2=0.1)
##D out3 = do.enet(X, y, lambda1=10,  lambda2=0.1)
##D out4 = do.enet(X, y, lambda1=0.1, lambda2=1)
##D out5 = do.enet(X, y, lambda1=1,   lambda2=1)
##D out6 = do.enet(X, y, lambda1=10,  lambda2=1)
##D out7 = do.enet(X, y, lambda1=0.1, lambda2=10)
##D out8 = do.enet(X, y, lambda1=1,   lambda2=10)
##D out9 = do.enet(X, y, lambda1=10,  lambda2=10)
##D 
##D ## visualize
##D ## ( , ) denotes two regularization parameters
##D par(mfrow=c(3,3))
##D plot(out1$Y[,1], out1$Y[,2], main="ENET::(0.1,0.1)")
##D plot(out2$Y[,1], out2$Y[,2], main="ENET::(1,  0.1)")
##D plot(out3$Y[,1], out3$Y[,2], main="ENET::(10, 0.1)")
##D plot(out4$Y[,1], out4$Y[,2], main="ENET::(0.1,1)")
##D plot(out5$Y[,1], out5$Y[,2], main="ENET::(1,  1)")
##D plot(out6$Y[,1], out6$Y[,2], main="ENET::(10, 1)")
##D plot(out7$Y[,1], out7$Y[,2], main="ENET::(0.1,10)")
##D plot(out8$Y[,1], out8$Y[,2], main="ENET::(1,  10)")
##D plot(out9$Y[,1], out9$Y[,2], main="ENET::(10, 10)")
## End(Not run)




