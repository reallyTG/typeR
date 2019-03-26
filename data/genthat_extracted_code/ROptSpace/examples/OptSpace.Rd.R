library(ROptSpace)


### Name: OptSpace
### Title: OptSpace : an algorithm for matrix reconstruction from a
###   partially revealed set
### Aliases: OptSpace

### ** Examples

## Parameter Settings
n = 1000;
m = 100;
r = 3;
tolerance = 1e-7
eps = 10*r*log10(n)

## Generate a matrix with given data
U = matrix(rnorm(n*r),nrow=n)
V = matrix(rnorm(m*r),nrow=m)
Sig = diag(r)
M0 = U%*%Sig%*%t(V)

## Set some entries to be NA with probability eps/sqrt(m*n)
E = 1 - ceiling(matrix(rnorm(n*m),nrow=n) - eps/sqrt(m*n))
M_E = M0
M_E[(E==0)] = NA

## Create a noisy version
noiselevel = 0.1
M_E_noise  = M_E + matrix(rnorm(n*m),nrow=n)*noiselevel

## Use OptSpace for reconstruction
res1 = OptSpace(M_E,tol=tolerance)
res2 = OptSpace(M_E_noise,tol=tolerance)

## Compute errors for both cases using Frobenius norm
err_clean = norm(res1$X%*%res1$S%*%t(res1$Y)-M0,'f')/sqrt(m*n)
err_noise = norm(res2$X%*%res2$S%*%t(res2$Y)-M0,'f')/sqrt(m*n)

## print out the results
m1 = sprintf('RMSE without noise         : %e',err_clean)
m2 = sprintf('RMSE with noise of %.2f    : %e',noiselevel,err_noise)
print(m1)
print(m2)




