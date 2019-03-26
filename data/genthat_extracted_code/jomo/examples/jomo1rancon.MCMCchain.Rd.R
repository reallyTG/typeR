library(jomo)


### Name: jomo1rancon.MCMCchain
### Title: JM Imputation of clustered data with continuous variables only -
###   A tool to check convergence of the MCMC
### Aliases: jomo1rancon.MCMCchain

### ** Examples

attach(cldata)

# we define all the inputs:
Y<-data.frame(measure,age)
X<-data.frame(rep(1,1000),sex)
Z<-data.frame(rep(1,1000))
clus<-data.frame(city)
beta.start<-matrix(0,2,2)
u.start<-matrix(0,10,2)
l1cov.start<-diag(1,2)
l2cov.start<-diag(1,2)
l1cov.prior=diag(1,2);
nburn=as.integer(200);

l2cov.prior=diag(1,5);

#And finally we run the imputation function:
imp<-jomo1rancon.MCMCchain(Y,X,Z,clus,beta.start,u.start,l1cov.start, 
          l2cov.start,l1cov.prior,l2cov.prior,nburn=nburn)

#We can check the convergence of the first element of beta:

plot(c(1:nburn),imp$collectbeta[1,1,1:nburn],type="l")

#Or similarly we can check the convergence of any element of the level 2 covariance matrix:

plot(c(1:nburn),imp$collectcovu[1,2,1:nburn],type="l")




