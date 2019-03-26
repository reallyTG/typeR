library(MLInterfaces)


### Name: RAB
### Title: real adaboost (Friedman et al)
### Aliases: RAB RAB4es DAB Predict tonp mkfmla Predict,raboostCont-method
###   Predict,daboostCont-method
### Keywords: models

### ** Examples

library(MASS)
data(Pima.tr)
data(Pima.te)
Pima.all = rbind(Pima.tr, Pima.te)
tonp = ifelse(Pima.all$type == "Yes", 1, -1)
tonp = factor(tonp)
Pima.all = data.frame(Pima.all[,1:7], mtype=tonp)
fit1 = RAB(mtype~ped+glu+npreg+bmi+age, data=Pima.all[1:200,], maxiter=10, maxdepth=5)
pfit1 = Predict(fit1, newdata=Pima.tr)
table(Pima.tr$type, pfit1)



