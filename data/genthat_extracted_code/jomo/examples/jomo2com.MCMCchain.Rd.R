library(jomo)


### Name: jomo2com.MCMCchain
### Title: JM Imputation of 2-level data assuming a common level-1
###   covariance matrix across level-2 units - A tool to check convergence
###   of the MCMC
### Aliases: jomo2com.MCMCchain

### ** Examples


attach(tldata)
nburn=20

#now we run the imputation function. Note that we would typically use an higher 
#number of nburn iterations in real applications (at least 100)

imp<-jomo2com.MCMCchain(Y.con=data.frame(measure.a), 
          Y2.cat=data.frame(big.city), Y2.numcat=c(2), clus=city,nburn=nburn)
          
#We can check the convergence of the first element of beta:

plot(c(1:nburn),imp$collectbeta[1,1,1:nburn],type="l")



