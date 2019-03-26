library(micemd)


### Name: micemd-package
### Title: Multiple Imputation by Chained Equations with Multilevel Data
### Aliases: micemd-package micemd
### Keywords: package multilevel imputation meta-analyse

### ** Examples


  require(lme4)
  data(CHEM97Na)
  
  ind.clust<-1#index for the cluster variable
  
  #initialisation of the argument predictorMatrix
  temp<-mice(CHEM97Na,m=1,maxit=0)
  temp$pred[ind.clust,ind.clust]<-0;temp$pred[-ind.clust,ind.clust]<- -2
  temp$pred[temp$pred==1]<-2
  predictor.matrix<-temp$pred
  
  #initialisation of the argument method
  method<-find.defaultMethod(CHEM97Na,ind.clust)
  
  #multiple imputation by chained equations (parallel calculation) [time consumming]
  #res.mice<-mice.par(CHEM97Na,predictorMatrix = predictor.matrix,method=method)
  
  #check convergence
  #plot(res.mice)
  
  #analysis (apply a generalized linear mixed effects model to each imputed dataset)
  #ana<-with(res.mice,expr=glmer(Score~Sex+GSCE+(1|School),
  #                            family="poisson",
  #                            control=glmerControl(optimizer = "bobyqa")))
                              
  #check the number of generated tables
  #plot(ana)

  #pooling
  #res.pool<-pool(ana)
  #summary(res.pool)
  



