library(jomo)


### Name: jomo1mix.MCMCchain
### Title: JM Imputation of single level data with mixed variable types
### Aliases: jomo1mix.MCMCchain

### ** Examples


attach(sldata)

#Then, we define all the inputs:
# nimp, nburn and nbetween are smaller than they should. This is
#just because of CRAN policies on the examples.

Y.con=data.frame(measure,age)
Y.cat=data.frame(social)
Y.numcat=matrix(4,1,1)
X=data.frame(rep(1,300),sex)
beta.start<-matrix(0,2,5)
l1cov.start<-diag(1,5)
l1cov.prior=diag(1,5);
nburn=as.integer(100);


#Then we run the sampler:

imp<-jomo1mix.MCMCchain(Y.con,Y.cat,Y.numcat,X,beta.start,l1cov.start,l1cov.prior,nburn=nburn)

#We can check the convergence of the first element of beta:

plot(c(1:nburn),imp$collectbeta[1,1,1:nburn],type="l")

#Or similarly we can check the convergence of any element of omega:

plot(c(1:nburn),imp$collectomega[1,2,1:nburn],type="l")





