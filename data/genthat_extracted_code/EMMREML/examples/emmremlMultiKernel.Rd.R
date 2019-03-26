library(EMMREML)


### Name: emmremlMultiKernel
### Title: Function to fit Gaussian mixed model with multiple mixed effects
###   with known covariances.
### Aliases: emmremlMultiKernel

### ** Examples


####example
#Data from Gaussian process with three 
#(total four, including residuals) independent 
#sources of variation 

n=80
M1<-matrix(rnorm(n*10), nrow=n)

M2<-matrix(rnorm(n*20), nrow=n)

M3<-matrix(rnorm(n*5), nrow=n)


#Relationship matrices
K1<-cov(t(M1))
K2<-cov(t(M2))
K3<-cov(t(M3))
K1=K1/mean(diag(K1))
K2=K2/mean(diag(K2))
K3=K3/mean(diag(K3))


#Generate data
covY<-2*(.2*K1+.7*K2+.1*K3)+diag(n)

Y<-10+crossprod(chol(covY),rnorm(n))

#training set
Trainsamp<-sample(1:80, 60)

funout<-emmremlMultiKernel(y=Y[Trainsamp], X=matrix(rep(1, n)[Trainsamp], ncol=1), 
Zlist=list(diag(n)[Trainsamp,], diag(n)[Trainsamp,], diag(n)[Trainsamp,]),
Klist=list(K1,K2, K3),
varbetahat=FALSE,varuhat=FALSE, PEVuhat=FALSE, test=FALSE)
#weights
funout$weights
#Correlation of predictions with true values in test set
uhatmat<-matrix(funout$uhat, ncol=3)
uhatvec<-rowSums(uhatmat)

cor(Y[-Trainsamp], uhatvec[-Trainsamp])



