library(bayesdistreg)


### Name: distreg_cfa.sas
### Title: Semi-asymptotic counterfactual distribution
### Aliases: distreg_cfa.sas

### ** Examples

y = faithful$waiting
x = scale(cbind(faithful$eruptions,faithful$eruptions^2))
qtaus = quantile(y,c(0.05,0.25,0.5,0.75,0.95))
drabj<- dr_asympar(y=y,x=x,thresh = qtaus); data = data.frame(y,x)
cfIND=2 #Note: the first column is the outcome variable. 
cft=0.95*data[,cfIND] # a decrease by 5%
cfa.sasobj<- distreg_cfa.sas(ind=2,drabj,data,cft,cfIND,vcovfn="vcov")
par(mfrow=c(1,2)); plot(density(cfa.sasobj$original,.1),main="Original")
plot(density(cfa.sasobj$counterfactual,.1),main="Counterfactual"); par(mfrow=c(1,1))




