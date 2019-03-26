library(mitools)


### Name: MIcombine
### Title: Multiple imputation inference
### Aliases: MIcombine MIcombine.default MIcombine.imputationResultList
###   print.MIresult summary.MIresult vcov.MIresult
### Keywords: htest manip

### ** Examples

data(smi)
models<-with(smi, glm(drinkreg~wave*sex,family=binomial()))
summary(MIcombine(models))

betas<-MIextract(models,fun=coef)
vars<-MIextract(models, fun=vcov)
summary(MIcombine(betas,vars))



