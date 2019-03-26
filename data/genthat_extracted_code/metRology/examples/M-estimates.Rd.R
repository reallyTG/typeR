library(metRology)


### Name: M-estimators
### Title: M- and MM-estimators for location.
### Aliases: M-estimators huber.estimate huber.estimate.default MM.estimate
###   MM.estimate.default
### Keywords: univar

### ** Examples



## Cd heat of vapourisation example 
## from Paule, R. C.  and Mandel, J. (1982) - see ?mpaule
x2<-c(27.044, 26.022, 26.340, 26.787, 26.796)
v<-c(3, 76, 464, 3, 14)*1e-3

MM.estimate(x2, sqrt(v))

huber.estimate(x2, sqrt(v))



