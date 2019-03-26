library(asbio)


### Name: joint.ci.bonf
### Title: Calculates joint confidence intervals for parameters in linear
###   models using a Bonferroni procedure.
### Aliases: joint.ci.bonf
### Keywords: univar htest

### ** Examples

Soil.C<-c(13,20,10,11,2,25,30,25,23)
Soil.N<-c(1.2,2,1.5,1,0.3,2,3,2.7,2.5)
Slope<-c(15,14,16,12,10,18,25,24,20)
Aspect<-c(45,120,100,56,5,20,5,15,15)
Y<-as.vector(c(20,30,10,15,5,45,60,55,45))
model<-lm(Y~Soil.C+Soil.N+Slope+Aspect)
joint.ci.bonf(model)



