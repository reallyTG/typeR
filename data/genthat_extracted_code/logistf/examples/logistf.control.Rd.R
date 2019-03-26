library(logistf)


### Name: logistf.control
### Title: Control Parameters for 'logistf'
### Aliases: logistf.control
### Keywords: regression models

### ** Examples

data(sexagg)
fit2<-logistf(case ~ age+oc+vic+vicl+vis+dia, data=sexagg, weights=COUNT, 
   control=logistf.control(maxstep=1))
summary(fit2)



