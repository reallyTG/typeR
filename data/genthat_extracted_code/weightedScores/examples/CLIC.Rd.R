library(weightedScores)


### Name: clic
### Title: CL1 INFORMATION CRITERIA
### Aliases: clic clic1dePar
### Keywords: regression

### ** Examples

  ################################################################################
  #                           Binary regression 
  ################################################################################
  ################################################################################
  #                      read and set up the data set
  ################################################################################
  data(childvisit)
  # covariates
  season1<-childvisit$q
  season1[season1>1]<-0
  xdat<-cbind(childvisit$sex,childvisit$age,childvisit$m,season1)
  # response
  ydat<-childvisit$hosp
  ydat[ydat>0]=1
  ydat=2-ydat
  #id
  id<-childvisit$id
  #time
  tvec<-childvisit$q
  ################################################################################
  #                      select the link
  ################################################################################
  link="logit"
  ################################################################################
  #                      select the  correlation structure
  ################################################################################
  corstr="exch"
  ################################################################################
  #                      perform CL1 estimation
  ################################################################################
  i.est<-iee.ord(xdat,ydat,link)
  cat("\niest: IEE estimates\n")
  print(c(i.est$reg,i.est$gam))
  # est.rho<-cl1.ord(b=i.est$reg,gam=i.est$gam,xdat,ydat,id,tvec,corstr,link)
  # cat("\nest.rho: CL1 estimates\n")
  # print(est.rho$e)
  # [1] 0.1961
  # cat("\nest.rho: negative CL1 log-likelhood\n")
  # print(est.rho$m)
  # [1] 576.5246
  ################################################################################
  #                      obtain the fixed weight matrices
  ################################################################################
  WtScMat<-weightMat.ord(b=i.est$reg,gam=i.est$gam,rh=0.1961,xdat,ydat,id,
                         tvec,corstr,link)
  ################################################################################
  #                      obtain the CL1 information criteria
  ################################################################################
  out<-clic1dePar(nbcl=576.5246,r=0.1961,i.est$r,i.est$g,xdat,id,tvec,corstr,WtScMat,link)



