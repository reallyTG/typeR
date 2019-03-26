library(micemd)


### Name: find.defaultMethod
### Title: Suggestion of conditional imputation models to use accordingly
###   to the incomplete dataset
### Aliases: find.defaultMethod
### Keywords: mice

### ** Examples


  data(CHEM97Na)
  
  ind.clust<-1#index for the cluster variable
  
  #initialisation of the argument predictorMatrix
  temp<-mice(CHEM97Na,m=1,maxit=0)
  temp$pred[ind.clust,ind.clust]<-0;temp$pred[-ind.clust,ind.clust]<- -2
  temp$pred[temp$pred==1]<-2
  predictor.matrix<-temp$pred
  
  #initialisation of the argument method
  method<-find.defaultMethod(CHEM97Na,ind.clust)
  print(method)
  
  #multiple imputation by chained equations (parallel calculation)
  #res.mice<-mice.par(CHEM97Na,m=3,predictorMatrix = predictor.matrix,method=method)




