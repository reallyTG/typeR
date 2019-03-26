library(dhglm)


### Name: plotdhglm
### Title: Produce Model-Checking Plots for a Double Hierarchical
###   Generalized Linear Model Analysis
### Aliases: plotdhglm
### Keywords: package

### ** Examples

#### Model checking plot for crack-growth data
data(crack_growth)
model_mu<-DHGLMMODELING(Model="mean", Link="log", 
LinPred=y~crack0+(1|specimen),RandDist="inverse-gamma")
model_phi<-DHGLMMODELING(Model="dispersion", Link="log", 
LinPred=phi~cycle+(1|specimen),RandDist="gaussian")
res_crack_dhglm1<-dhglmfit(RespDist="gamma", DataMain=crack_growth, 
MeanModel=model_mu, DispersionModel=model_phi,Maxiter=1)
plotdhglm(res_crack_dhglm1)



