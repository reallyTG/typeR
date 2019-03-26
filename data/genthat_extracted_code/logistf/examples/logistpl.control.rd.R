library(logistf)


### Name: logistpl.control
### Title: Control Parameters for logistf Profile Likelihood Confidence
###   Interval Estimation
### Aliases: logistpl.control
### Keywords: regression models

### ** Examples

data(sexagg)
fit2<-logistf(case ~ age+oc+vic+vicl+vis+dia, data=sexagg, weights=COUNT, 
   plcontrol=logistpl.control(maxstep=1))
summary(fit2)



