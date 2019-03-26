library(dhglm)


### Name: dhglm-package
### Title: Double Hierarchical Genearlized Linear Models
### Aliases: dhglm-package
### Keywords: package

### ** Examples

### DHGLM introducing random effects in the overdispersion for crack growth data
data(crack_growth)
model_mu<-DHGLMMODELING(Model="mean", Link="log", LinPred=y~crack0+(1|specimen),
RandDist="inverse-gamma")
model_phi<-DHGLMMODELING(Model="dispersion", Link="log", 
LinPred=phi~cycle+(1|specimen), RandDist="gaussian")
res_crack<-dhglmfit(RespDist="gamma",DataMain=crack_growth,
MeanModel=model_mu,DispersionModel=model_phi,Maxiter=1)



