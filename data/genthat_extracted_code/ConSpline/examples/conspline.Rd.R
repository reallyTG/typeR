library(ConSpline)


### Name: conspline
### Title: Partial Linear Least-Squares with Constrained Regression Splines
### Aliases: conspline
### Keywords: splines monotone convex concave partial linear
###   semi-parametric

### ** Examples

n=60
x=1:n/n
z=sample(0:1,n,replace=TRUE)
mu=1:n*0+4
mu[x>1/2]=4+5*(x[x>1/2]-1/2)^2
mu=mu+z/4
y=mu+rnorm(n)/4
plot(x,y,col=z+1)
ans=conspline(y,x,5,z,test=TRUE)
points(x,ans$muhat,pch=20,col=z+1)
lines(x,ans$fhat)
lines(x,ans$fhat+ans$zcoef, col=2)
ans$pvalz  ## p-val for test of significance of z parameter
ans$pvalx  ## p-val for test for linear vs convex regression function



