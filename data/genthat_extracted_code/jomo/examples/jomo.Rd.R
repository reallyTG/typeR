library(jomo)


### Name: jomo
### Title: Joint Modelling Imputation
### Aliases: jomo

### ** Examples


  attach(cldata)
  
  # define all the inputs:
  
  Y<-data.frame(measure,age)
  clus<-data.frame(city)
  nburn=as.integer(200);
  nbetween=as.integer(200);
  nimp=as.integer(5);
  
  
  #And finally we run the imputation function:
  imp<-jomo(Y,clus=clus,nburn=nburn,nbetween=nbetween,nimp=nimp)
  
  #we could even run it with fixed or random cluster-specific covariance matrices:
  
  #imp<-jomo(Y,clus=clus,nburn=nburn,nbetween=nbetween,nimp=nimp, meth="fixed")
  #or:
  #imp<-jomo(Y,clus=clus,nburn=nburn,nbetween=nbetween,nimp=nimp, meth="random")
  
  #if we do not add clus as imput, functions for single level imputation are used:
  
  #imp<-jomo(Y)

  
  



