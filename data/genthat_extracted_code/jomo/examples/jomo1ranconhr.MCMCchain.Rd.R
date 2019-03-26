library(jomo)


### Name: jomo1ranconhr.MCMCchain
### Title: JM Imputation of clustered data with continuous variables only
###   with cluster-specific covariance matrices - A tool to check
###   convergence of the MCMC
### Aliases: jomo1ranconhr.MCMCchain

### ** Examples


attach(cldata)

# we define the inputs
# nimp, nburn and nbetween are smaller than they should. This is
#just because of CRAN policies on the examples.

Y<-data.frame(measure,age)
X<-data.frame(rep(1,1000),sex)
Z<-data.frame(rep(1,1000))
clus<-data.frame(city)
beta.start<-matrix(0,2,2)
u.start<-matrix(0,10,2)
l1cov.start<-matrix(diag(1,2),20,2,2)
l2cov.start<-diag(1,2)
l1cov.prior=diag(1,2);
nburn=as.integer(50);

l2cov.prior=diag(1,5);
a=3

# Finally we run either the model with fixed or random cluster-specific cov. matrices:

imp<-jomo1ranconhr.MCMCchain(Y,X,Z,clus,beta.start,u.start,l1cov.start, l2cov.start,
          l1cov.prior,l2cov.prior,nburn=nburn,meth="random")
          
#We can check the convergence of the first element of beta:

plot(c(1:nburn),imp$collectbeta[1,1,1:nburn],type="l")

#Or similarly we can check the convergence of any element of th elevel 2 cov. matrix:

plot(c(1:nburn),imp$collectcovu[1,2,1:nburn],type="l")



