library(MRCE)


### Name: mrce
### Title: Do multivariate regression with covariance estimation (MRCE)
### Aliases: mrce

### ** Examples

set.seed(5)
n=50
p=10
q=5

Omega0.inv=diag(q)
for(i in 1:q) for(j in 1:q)
  Omega0.inv[i,j]=0.7^abs(i-j)
out=eigen(Omega0.inv, symmetric=TRUE)
Omega0.inv.sqrt=tcrossprod(out$vec*rep(out$val^(0.5), each=q),out$vec)
Omega0=tcrossprod(out$vec*rep(out$val^(-1), each=q),out$vec)

X=matrix(rnorm(n*p), nrow=n, ncol=p)
E=matrix(rnorm(n*p), nrow=n, ncol=q)%*%Omega0.inv.sqrt
B0=matrix(rbinom(p*q, size=1, prob=0.1)*runif(p*q, min=1, max=2), nrow=p, ncol=q)

Y=X%*%B0 + E

lam1.vec=rev(10^seq(from=-2, to=0, by=0.5))
lam2.vec=rev(10^seq(from=-2, to=0, by=0.5))
cvfit=mrce(Y=Y, X=X, lam1.vec=lam1.vec, lam2.vec=lam2.vec, method="cv")
cvfit

fit=mrce(Y=Y, X=X, lam1=10^(-1.5), lam2=10^(-0.5), method="single")
fit

lam2.mat=1000*(fit$Bhat==0)
refit=mrce(Y=Y, X=X, lam2=lam2.mat, method="fixed.omega", omega=fit$omega, tol.in=1e-12) 
refit



