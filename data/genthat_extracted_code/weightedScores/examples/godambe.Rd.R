library(weightedScores)


### Name: godambe
### Title: INVERSE GODAMBE MATRIX
### Aliases: godambe godambe.ord
### Keywords: regression

### ** Examples

################################################################################
#                           Poisson regression 
################################################################################
################################################################################
#                      read and set up the data set
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
margmodel="poisson"
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
#                      obtain the fixed weight matrices
################################################################################
WtScMat<-weightMat(b=i.est$reg,gam=i.est$gam,rh=est.rho$e,
xdat,ydat,id,tvec,margmodel,corstr)
################################################################################
#                      obtain the weighted scores estimates
################################################################################
# solve the nonlinear system of equations
ws<-solvewtsc(start=c(i.est$reg,i.est$gam),WtScMat,xdat,ydat,id,
tvec,margmodel,link)
cat("ws=parameter estimates\n")
print(ws$r)
################################################################################
#                      obtain the inverse Godambe matrix
################################################################################
acov<-godambe(ws$r,WtScMat,xdat,ydat,id,tvec,margmodel)
cat("\nacov: inverse Godambe matrix with W based on first-stage wt
matrices\n")
print(acov)
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
##D cat("\nest.rho: CL1 estimates\n")
##D print(est.rho$e)
##D ################################################################################
##D #                      obtain the fixed weight matrices
##D ################################################################################
##D WtScMat<-weightMat.ord(b=i.est$reg,gam=i.est$gam,rh=est.rho$e,xdat,ydat,id,
##D tvec,corstr,link)
##D ################################################################################
##D #                      obtain the weighted scores estimates
##D ################################################################################
##D # solve the nonlinear system of equations
##D ws<-solvewtsc.ord(start=c(i.est$reg,i.est$gam),WtScMat,xdat,ydat,id,
##D tvec,link)
##D cat("ws=parameter estimates\n")
##D print(ws$r)
##D ################################################################################
##D #                      obtain the inverse Godambe matrix
##D ################################################################################
##D acov<-godambe.ord(ws$r,WtScMat,xdat,ydat,id,tvec,link)
##D cat("\nacov: inverse Godambe matrix with W based on first-stage wt
##D matrices\n")
##D print(acov)
## End(Not run)



