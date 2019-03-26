library(bayesdistreg)


### Name: jdpar.asymp
### Title: Joint asymptotic mutivariate density of parameters
### Aliases: jdpar.asymp

### ** Examples

y = faithful$waiting
x = scale(cbind(faithful$eruptions,faithful$eruptions^2))
qtaus = quantile(y,c(0.05,0.25,0.5,0.75,0.95))
drabj<- dr_asympar(y=y,x=x,thresh = qtaus); data = data.frame(y,x)
(drjasy = jdpar.asymp(drabj=drabj,data=data,jdF=TRUE))




