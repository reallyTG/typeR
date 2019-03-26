library(jomo)


### Name: jomo1rancathr.MCMCchain
### Title: JM Imputation of clustered data with categorical variables with
###   cluster-specific covariance matrices - A tool to check convergence of
###   the MCMC
### Aliases: jomo1rancathr.MCMCchain

### ** Examples


attach(cldata)

#we define the inputs
# nimp, nburn and nbetween are smaller than they should. This is
#just because of CRAN policies on the examples.

Y.cat=data.frame(social)
Y.numcat=matrix(4,1,1)
X=data.frame(rep(1,1000),sex)
Z<-data.frame(rep(1,1000))
clus<-data.frame(city)
beta.start<-matrix(0,2,3)
u.start<-matrix(0,10,3)
l1cov.start<-matrix(diag(1,3),30,3,2)
l2cov.start<-diag(1,3)
l1cov.prior=diag(1,3);
l2cov.prior=diag(1,3);
a=5
nburn=as.integer(100);

#Finally we run either the model with fixed or random cluster-specific covariance matrices:

imp<-jomo1rancathr.MCMCchain(Y.cat, Y.numcat, X,Z,clus,beta.start,
          u.start,l1cov.start, l2cov.start,l1cov.prior,l2cov.prior,nburn=nburn, a=a, meth="fixed")

#We can check the convergence of the first element of beta:

plot(c(1:nburn),imp$collectbeta[1,1,1:nburn],type="l")

#Or similarly we can check the convergence of any element of th elevel 2 covariance matrix:

plot(c(1:nburn),imp$collectcovu[1,2,1:nburn],type="l")



