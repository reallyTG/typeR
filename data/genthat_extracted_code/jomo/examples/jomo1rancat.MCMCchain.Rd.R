library(jomo)


### Name: jomo1rancat.MCMCchain
### Title: JM Imputation of clustered data with categorical variables - A
###   tool to check convergence of the MCMC
### Aliases: jomo1rancat.MCMCchain

### ** Examples

attach(cldata)

# define all the inputs:
# nimp, nburn and nbetween are smaller than they should. This is
#just because of CRAN policies on the examples.

Y.cat=data.frame(social)
Y.numcat=matrix(4,1,1)
X=data.frame(rep(1,1000),sex)
Z<-data.frame(rep(1,1000))
clus<-data.frame(city)
beta.start<-matrix(0,2,3)
u.start<-matrix(0,10,3)
l1cov.start<-diag(1,3)
l2cov.start<-diag(1,3)
l1cov.prior=diag(1,3);
l2cov.prior=diag(1,3);
nburn=as.integer(100);

#And finally we run the imputation function:

imp<-jomo1rancat.MCMCchain(Y.cat, Y.numcat, X,Z,clus,beta.start,u.start,l1cov.start, 
l2cov.start,l1cov.prior,l2cov.prior,nburn=nburn)
#We can check the convergence of the first element of beta:

plot(c(1:nburn),imp$collectbeta[1,1,1:nburn],type="l")

#Or similarly we can check the convergence of any element of the level 2 covariance matrix:

plot(c(1:nburn),imp$collectcovu[1,2,1:nburn],type="l")



