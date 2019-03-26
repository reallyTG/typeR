library(jomo)


### Name: jomo.MCMCchain
### Title: JM Imputation - A tool to check convergence of the MCMC
### Aliases: jomo.MCMCchain

### ** Examples


  attach(cldata)
  
  # define all the inputs:
  
  Y<-data.frame(measure,age)
  clus<-data.frame(city)
  nburn=as.integer(200);
  
  #And finally we run the imputation function:
  imp<-jomo.MCMCchain(Y,clus=clus,nburn=nburn)
  #We can check the convergence of the first element of beta:
  
  plot(c(1:nburn),imp$collectbeta[1,1,1:nburn],type="l")
  
  #Or similarly we can check the convergence of any element of th elevel 2 covariance matrix:
  
  plot(c(1:nburn),imp$collectcovu[1,2,1:nburn],type="l")



