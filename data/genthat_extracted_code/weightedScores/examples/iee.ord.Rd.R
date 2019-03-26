library(weightedScores)


### Name: iee.ord
### Title: Maximum Likelihood for Ordinal Model
### Aliases: iee.ord
### Keywords: models

### ** Examples

  ################################################################################
  #                         Ordinal regression 
  ################################################################################
  ################################################################################
  #                      read and set up data set
  ################################################################################
  data(arthritis)
  nn=nrow(arthritis)
  bas2<-bas3<-bas4<-bas5<-rep(0,nn)
  bas2[arthritis$b==2]<-1
  bas3[arthritis$b==3]<-1
  bas4[arthritis$b==4]<-1
  bas5[arthritis$b==5]<-1
  t2<-t3<-rep(0,nn)
  t2[arthritis$ti==3]<-1
  t3[arthritis$ti==5]<-1
  xdat=cbind(t2,t3,arthritis$trt,bas2,bas3,bas4,bas5,arthritis$age) 
  ydat=arthritis$y
  ################################################################################
  #                      select the link
  ################################################################################
  link="probit"
  ################################################################################
  i.est<- iee.ord(xdat,ydat,link)
  print(i.est)



