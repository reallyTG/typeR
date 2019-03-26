library(micemd)


### Name: plot.mira
### Title: Graphical investigation for the number of generated datasets
### Aliases: plot.mira

### ** Examples


  require(nlme)
  data(CHEM97Na)
  
  ind.clust<-1#index for the cluster variable
  
  #initialisation of the argument predictorMatrix
  temp<-mice(CHEM97Na,m=1,maxit=0)
  temp$pred[ind.clust,ind.clust]<-0;temp$pred[-ind.clust,ind.clust]<- -2
  temp$pred[temp$pred==1]<-2
  predictor.matrix<-temp$pred
  
  #initialisation of the argument method
  method<-c("", "2l.2stage.bin", "2l.2stage.pois", "2l.2stage.norm", "") #quickest methods
  
  #multiple imputation by chained equations (parallel calculation)
  #res.mice<-mice.par(CHEM97Na,m=15,predictorMatrix = predictor.matrix,method=method)

  #analysis (apply a linear mixed effects model to each imputed dataset)
  #ana<-with(res.mice,expr=lme(fixed=formula(Score~Sex+GSCE+Age),
  #                            random=formula(~1|School),method="REML",
  #                            control=list(maxIter=100,msMaxIter=100,niterEM=25)))

  #graphical investigation for the number of generated datasets m
  #plot(ana)




