library("freqdom")
library(pcdpca)

d = 7
n = 10000
A = t(t(matrix(rnorm(d*n),ncol=d,nrow=n)))
B = t(t(matrix(rnorm(d*n),ncol=d,nrow=n)))
C = t(t(matrix(rnorm(d*n),ncol=d,nrow=n)))
X = matrix(0,ncol=d,nrow=3*n)

X[3*(1:n) - 1,] = A
X[3*(1:n),] = A + B
X[3*(1:n),] = 2*A - B + C

cov = cov.structure(X,X,2)

train = 1:(n/2)
test = (1+n/2):n

## Periodically correlated PCA ##
XI.est.pc = pcdpca(as.matrix(X[train,]),q=10,freq=pi*(-150:150/150),period=3)  # finds the optimal filter
Y.est.pc = pcdpca.scores(X, XI.est.pc)  # applies the filter
Y.est.pc[,-1] = 0 # forces the use of only one component
Xpcdpca.est = pcdpca.inverse(Y.est.pc, XI.est.pc)  # deconvolution
r2 = sum((X[test,] - Xpcdpca.est[test,])**2 ) / sum( (X[test,])**2 )
r2
