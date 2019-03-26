library(survRM2adapt)


### Name: survRM2adapt-package
### Title: Flexible and Coherent Test/Estimation Procedure Based on
###   Restricted Mean Survival Times
### Aliases: survRM2adapt-package
### Keywords: survival

### ** Examples

#--- sample data ---#
data    = rmst2adapt.sample.data()
nmethod = 100 #This is only for example use.
              #Recommended to specify at least 100000 (default) or larger.

a = rmst2adapt(indata=data, tau_star=seq(6,12,2), method="perturbation",
               nmethod=nmethod, test="2_side")
print(a)



