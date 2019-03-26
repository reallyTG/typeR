library(jomo)


### Name: jomo1.MCMCchain
### Title: JM Imputation of single level data - A tool to check convergence
###   of the MCMC
### Aliases: jomo1.MCMCchain

### ** Examples


attach(sldata)

#We define all the inputs:

Y=data.frame(measure,age)
nburn=as.integer(200);

# Then we run the function:

imp<-jomo1.MCMCchain(Y,nburn=nburn)

#We can check the convergence of the first element of beta:

plot(c(1:nburn),imp$collectbeta[1,1,1:nburn],type="l")

#Or similarly we can check the convergence of any element of omega:

plot(c(1:nburn),imp$collectomega[1,2,1:nburn],type="l")





