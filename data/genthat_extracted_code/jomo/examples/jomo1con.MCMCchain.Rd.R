library(jomo)


### Name: jomo1con.MCMCchain
### Title: JM Imputation of single level data with continuous variables
###   only - A tool to check convergence of the MCMC
### Aliases: jomo1con.MCMCchain

### ** Examples


attach(sldata)

#We define all the inputs:

Y=data.frame(measure,age)
X=data.frame(rep(1,300),sex)
beta.start<-matrix(0,2,2)
l1cov.start<-diag(1,2)
l1cov.prior=diag(1,2);
nburn=as.integer(200);

# Then we run he function:

imp<-jomo1con.MCMCchain(Y,X,beta.start,l1cov.start,l1cov.prior,nburn=nburn)

#We can check the convergence of the first element of beta:

plot(c(1:nburn),imp$collectbeta[1,1,1:nburn],type="l")

#Or similarly we can check the convergence of any element of omega:

plot(c(1:nburn),imp$collectomega[1,2,1:nburn],type="l")



