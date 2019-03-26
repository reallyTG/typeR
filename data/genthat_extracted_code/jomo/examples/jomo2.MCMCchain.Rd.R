library(jomo)


### Name: jomo2.MCMCchain
### Title: JM Imputation of 2-level data - A tool to check convergence of
###   the MCMC
### Aliases: jomo2.MCMCchain

### ** Examples


attach(tldata)
nburn=20

#now we run the imputation function. Note that we would typically use an higher 
#number of nburn iterations in real applications (at least 100)

imp<-jomo2.MCMCchain(Y=data.frame(measure.a), Y2=data.frame(big.city), clus=city,nburn=nburn)

#We can check the convergence of the first element of beta:

plot(c(1:nburn),imp$collectbeta[1,1,1:nburn],type="l")

#Or similarly we can check the convergence of any element of the level 2 covariance matrix:

plot(c(1:nburn),imp$collectcovu[1,2,1:nburn],type="l")



