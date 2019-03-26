library(jomo)


### Name: jomo1ranmix.MCMCchain
### Title: JM Imputation of clustered data with mixed variable types - A
###   tool to check convergence of the MCMC
### Aliases: jomo1ranmix.MCMCchain

### ** Examples


attach(cldata)

#we define the inputs:
# nimp, nburn and nbetween are smaller than they should. This is
#just because of CRAN policies on the examples.

Y.con=data.frame(measure,age)
Y.cat=data.frame(social)
Y.numcat=matrix(4,1,1)
X=data.frame(rep(1,1000),sex)
Z<-data.frame(rep(1,1000))
clus<-data.frame(city)
beta.start<-matrix(0,2,5)
u.start<-matrix(0,10,5)
l1cov.start<-diag(1,5)
l2cov.start<-diag(1,5)
l1cov.prior=diag(1,5);
l2cov.prior=diag(1,5);
nburn=as.integer(100);

#Then we can run the sampler:

imp<-jomo1ranmix.MCMCchain(Y.con, Y.cat, Y.numcat, X,Z,clus,beta.start,u.start,
             l1cov.start, l2cov.start,l1cov.prior,l2cov.prior,nburn=nburn)

#We can check the convergence of the first element of beta:

plot(c(1:nburn),imp$collectbeta[1,1,1:nburn],type="l")

#Or similarly we can check the convergence of any element of the level 2 covariance matrix:

plot(c(1:nburn),imp$collectcovu[1,2,1:nburn],type="l")



