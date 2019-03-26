library(mitools)


### Name: MIextract
### Title: Extract a parameter from a list of results
### Aliases: MIextract
### Keywords: manip

### ** Examples

data(smi)
models<-with(smi, glm(drinkreg~wave*sex,family=binomial()))

betas<-MIextract(models,fun=coef)
vars<-MIextract(models, fun=vcov)
summary(MIcombine(betas,vars))



