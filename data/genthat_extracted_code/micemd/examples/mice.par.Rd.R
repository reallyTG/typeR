library(micemd)


### Name: mice.par
### Title: Parallel calculations for Multivariate Imputation by Chained
###   Equations
### Aliases: mice.par
### Keywords: mice

### ** Examples


  ##############
  #CHEM97Na (1681 observations and 5 variables)
  ##############
  
  data(CHEM97Na)
  
  ind.clust<-1#index for the cluster variable
  
  #initialisation of the argument predictorMatrix
  temp<-mice(CHEM97Na,m=1,maxit=0)
  temp$pred[ind.clust,ind.clust]<-0
  temp$pred[-ind.clust,ind.clust]<- -2
  temp$pred[temp$pred==1]<-2
  predictor.matrix<-temp$pred
  
  #initialisation of the argument method
  method<-find.defaultMethod(CHEM97Na,ind.clust)
  
  #multiple imputation by chained equations (parallel calculation) [1 minute]
  #(the imputation process can be followed by open the files output.txt in the working directory)
  #res.mice<-mice.par(CHEM97Na,
  #                  predictorMatrix = predictor.matrix,
  #                  method=method,
  #                  path.outfile=getwd())

  
  #multiple imputation by chained equations (without parallel calculation) [4.8 minutes]
  #res.mice<-mice(CHEM97Na,
  #                  predictorMatrix = predictor.matrix,
  #                  method=method)

  
  
  ############
  #IPDNa (11685 observations and 10 variables)
  ############
  
  data(IPDNa)
  
  ind.clust<-1#index for the cluster variable

  #initialisation of the argument predictorMatrix
  temp<-mice(IPDNa,m=1,maxit=0)
  temp$pred[ind.clust,ind.clust]<-0
  temp$pred[-ind.clust,ind.clust]<- -2
  temp$pred[temp$pred==1]<-2
  predictor.matrix<-temp$pred

  #initialisation of the argument method
  method<-find.defaultMethod(IPDNa,ind.clust)

  #multiple imputation by chained equations (parallel calculation)

  #res.mice<-mice.par(IPDNa,
  #                 predictorMatrix = predictor.matrix,
  #                 method=method,
  #                 path.outfile=getwd())



