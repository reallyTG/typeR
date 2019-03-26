library(genSurv)


### Name: genCPHM
### Title: Generation of survival data from a Cox Proportional Hazard Model
### Aliases: genCPHM
### Keywords: datagen survival

### ** Examples

cphmdata <- genCPHM(n=1000, model.cens="exponential", cens.par=2, beta= 2, covar=1)
head(cphmdata, n=20L)
library(survival)
fit<-coxph(Surv(time,status)~covariate,data=cphmdata)
summary(fit)



