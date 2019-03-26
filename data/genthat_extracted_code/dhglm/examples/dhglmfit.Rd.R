library(dhglm)


### Name: dhglmfit
### Title: Fitting Double Hierarchical Generalized Linear Models using
###   h-likelihood Approach
### Aliases: dhglmfit

### ** Examples

#### Analysis of crack-growth data ####
data(crack_growth)
## GLM ##
model_mu<-DHGLMMODELING(Model="mean", Link="log", 
LinPred=y~crack0)
model_phi<-DHGLMMODELING(Model="dispersion")
res_glm<-dhglmfit(RespDist="gamma",DataMain=crack_growth,
MeanModel=model_mu,DispersionModel=model_phi,Maxiter=1)
## JGLM ##
model_mu<-DHGLMMODELING(Model="mean", Link="log",
LinPred=y~crack0)
model_phi<-DHGLMMODELING(Model="dispersion", Link="log", 
LinPred=phi~cycle)
res_jglm<-dhglmfit(RespDist="gamma",DataMain=crack_growth,
MeanModel=model_mu,DispersionModel=model_phi,Maxiter=1)
## HGLM I ##
model_mu<-DHGLMMODELING(Model="mean", Link="log", 
LinPred=y~crack0+(1|specimen),RandDist="inverse-gamma")
model_phi<-DHGLMMODELING(Model="dispersion")
res_hglm1<-dhglmfit(RespDist="gamma",DataMain=crack_growth,
MeanModel=model_mu,DispersionModel=model_phi,Maxiter=1)
## HGLM II ##
model_mu<-DHGLMMODELING(Model="mean", Link="log", 
LinPred=y~crack0+(1|specimen),RandDist="inverse-gamma")
model_phi<-DHGLMMODELING(Model="dispersion", Link="log", 
LinPred=phi~cycle)
res_hglm2<-dhglmfit(RespDist="gamma",DataMain=crack_growth,
MeanModel=model_mu,DispersionModel=model_phi,Maxiter=1)
## DHGLM I ##
model_mu<-DHGLMMODELING(Model="mean", Link="log",
 LinPred=y~crack0+(1|specimen),RandDist="inverse-gamma")
model_phi<-DHGLMMODELING(Model="dispersion", Link="log", 
LinPred=phi~cycle+(1|specimen),RandDist="gaussian")
res_dhglm1<-dhglmfit(RespDist="gamma",DataMain=crack_growth,
MeanModel=model_mu,DispersionModel=model_phi,Maxiter=1)

#### Analysis of epilepsy data ####
data(epilepsy)
model_mu<-DHGLMMODELING(Model="mean", Link="log", 
LinPred=y~B+T+A+T*B+V+(1|patient),
RandDist=c("gaussian"))
model_phi<-DHGLMMODELING(Model="dispersion")
# res_hglm<-dhglmfit(RespDist="poisson",DataMain=epilepsy,
# MeanModel=model_mu,DispersionModel=model_phi,Maxiter=1)



