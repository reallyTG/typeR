library(rankhazard)


### Name: rankhazard-package
### Title: Rank-hazard plots
### Aliases: rankhazard-package rankhazard
### Keywords: package hplot survival

### ** Examples

library(survival)
model <- coxph(Surv(time,status) ~ age + sex + ph.karno, data = cancer, x=TRUE)
rankhazardplot(model, data=cancer)
library(rms)
model2 <- cph(Surv(time,status) ~ age + sex + ph.karno, data = cancer, x=TRUE)
dd <- datadist(cancer)
options(datadist="dd")
rankhazardplot(model2, data=cancer)



