library(weightedScores)


### Name: cl1
### Title: OPTIMIZATION ROUTINE FOR BIVARIATE COMPOSITE LIKELIHOOD FOR MVN
###   COPULA
### Aliases: cl1 cl1.ord
### Keywords: models

### ** Examples

################################################################################
#                      NB1 regression for count data
################################################################################
################################################################################
#                      read and set up data set
################################################################################
data(childvisit)
# covariates
season1<-childvisit$q
season1[season1>1]<-0
xdat<-cbind(1,childvisit$sex,childvisit$age,childvisit$m,season1)
# response
ydat<-childvisit$hosp
#id
id<-childvisit$id
#time
tvec<-childvisit$q
################################################################################
#                      select the marginal model
################################################################################
margmodel="nb1"
################################################################################
#                      select the  correlation structure
################################################################################
corstr="exch"
################################################################################
#                      perform CL1 estimation
################################################################################
i.est<-iee(xdat,ydat,margmodel)
cat("\niest: IEE estimates\n")
print(c(i.est$reg,i.est$gam))
est.rho<-cl1(b=i.est$reg,gam=i.est$gam,xdat,ydat,id,tvec,margmodel,corstr)
cat("\nest.rho: CL1 estimates\n")
print(est.rho$e)
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
##D link="logit"
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
##D cat("\nest.rho: CL1 estimates\n")
##D print(est.rho$e)
## End(Not run)



