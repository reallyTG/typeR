library(survIDINRI)


### Name: IDI.INF
### Title: Inference for IDI, continuous NRI, and median improvement
### Aliases: IDI.INF
### Keywords: ~kwd1 ~kwd2

### ** Examples


  #--- sample data (pbc in survival package) ---
  D=subset(pbc, select=c("time","status","age","albumin","edema","protime","bili"))
  D$status=as.numeric(D$status==2)
  D=D[!is.na(apply(D,1,mean)),] ; dim(D)  
  mydata=D[1:100,]

  t0=365*5
  indata1=mydata; 
  indata0=mydata[,-7] ; n=nrow(D) ;
  covs1<-as.matrix(indata1[,c(-1,-2)])
  covs0<-as.matrix(indata0[,c(-1,-2)])

  #--- inference ---
  x<-IDI.INF(mydata[,1:2], covs0, covs1, t0, npert=200) ; 

  #--- results ---
  IDI.INF.OUT(x) ;

  #--- Graphical presentaion of the estimates ---
  # IDI.INF.GRAPH(x) ;




