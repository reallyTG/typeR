library(EMMREML)


### Name: emmreml
### Title: Solver for Gaussian mixed model with known covariance structure.
### Aliases: emmreml

### ** Examples

n=200
M1<-matrix(rnorm(n*300), nrow=n)
K1<-cov(t(M1))
K1=K1/mean(diag(K1))

covY<-2*K1+1*diag(n)

Y<-10+crossprod(chol(covY),rnorm(n))


#training set
Trainset<-sample(1:n, 150)

funout<-emmreml(y=Y[Trainset], X=matrix(rep(1, n)[Trainset], ncol=1),
 Z=diag(n)[Trainset,], K=K1)

cor(Y[-Trainset], funout$uhat[-Trainset])




