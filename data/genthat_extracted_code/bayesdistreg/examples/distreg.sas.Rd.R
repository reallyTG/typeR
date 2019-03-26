library(bayesdistreg)


### Name: distreg.sas
### Title: Semi-asymptotic bayesian distribution
### Aliases: distreg.sas

### ** Examples

y = faithful$waiting
x = scale(cbind(faithful$eruptions,faithful$eruptions^2))
qtaus = quantile(y,c(0.05,0.25,0.5,0.75,0.95))
drabj<- dr_asympar(y=y,x=x,thresh = qtaus); data = data.frame(y,x)
drsas1 = lapply(1:5,distreg.sas,drabj=drabj,data=data,iter=100)
drsas2 = lapply(1:5,distreg.sas,drabj=drabj,data=data,vcovfn="vcovHC",iter=100)
par(mfrow=c(3,2));invisible(lapply(1:5,function(i)plot(density(drsas1[[i]],.1))));par(mfrow=c(1,1))
par(mfrow=c(3,2));invisible(lapply(1:5,function(i)plot(density(drsas2[[i]],.1))));par(mfrow=c(1,1))




