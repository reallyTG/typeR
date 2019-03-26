library(weightedScores)


### Name: weightMat
### Title: WEIGHT MATRICES FOR THE ESTIMATING EQUATIONS
### Aliases: weightMat weightMat.ord

### ** Examples

################################################################################
#                            binary regression
################################################################################
################################################################################
#                      read and set up the data set
################################################################################
data(toenail)
xdat<-cbind(1,toenail$treat,toenail$time,toenail$treat*toenail$time)
# response
ydat<-toenail$y
#id
id<-toenail$id
#time
tvec<-toenail$time
################################################################################
#                      select the marginal model
################################################################################
margmodel="bernoulli"
link="probit"
################################################################################
#                      select the  correlation structure
################################################################################
corstr="ar"
################################################################################
#                      perform CL1 estimation
################################################################################
i.est<-iee(xdat,ydat,margmodel,link)
cat("\niest: IEE estimates\n")
print(c(i.est$reg,i.est$gam))
# est.rho<-cl1(b=i.est$reg,gam=i.est$gam,xdat,ydat,id,tvec,margmodel,corstr,link)
# cat("\nest.rho: CL1 estimates\n")
# print(est.rho$e)
# [1] 0.8941659
################################################################################
#                      obtain the fixed weight matrices
################################################################################
WtScMat<-weightMat(b=i.est$reg,gam=i.est$gam,rh=0.8941659,
xdat,ydat,id,tvec,margmodel,corstr,link)
################################################################################
#                         Ordinal regression 
################################################################################
################################################################################
#                      read and set up data set
################################################################################
## Not run: 
##D data(arthritis)
##D nn=nrow(arthritis)
##D bas2<-bas3<-bas4<-bas5<-rep(0,nn)
##D bas2[arthritis$b==2]<-1
##D bas3[arthritis$b==3]<-1
##D bas4[arthritis$b==4]<-1
##D bas5[arthritis$b==5]<-1
##D t2<-t3<-rep(0,nn)
##D t2[arthritis$ti==3]<-1
##D t3[arthritis$ti==5]<-1
##D xdat=cbind(t2,t3,arthritis$trt,bas2,bas3,bas4,bas5,arthritis$age) 
##D ydat=arthritis$y
##D id<-arthritis$id
##D #time
##D tvec<-arthritis$time
##D ################################################################################
##D #                      select the link
##D ################################################################################
##D link="probit"
##D ################################################################################
##D #                      select the  correlation structure
##D ################################################################################
##D corstr="exch"
##D ################################################################################
##D #                      perform CL1 estimation
##D ################################################################################
##D i.est<-iee.ord(xdat,ydat,link)
##D cat("\niest: IEE estimates\n")
##D print(c(i.est$reg,i.est$gam))
##D est.rho<-cl1.ord(b=i.est$reg,gam=i.est$gam,xdat,ydat,id,tvec,corstr,link)
##D WtScMat<-weightMat.ord(b=i.est$reg,gam=i.est$gam,rh=est.rho$e,xdat,ydat,id,tvec,corstr,link)
## End(Not run)



