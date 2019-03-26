library(kyotil)


### Name: regression.model.functions
### Title: Regression Model Functions
### Aliases: coef.geese coef.tps getFixedEf getFixedEf.coxph getFixedEf.gam
###   getFixedEf.tps getFixedEf.gee getFixedEf.geese getFixedEf.glm
###   getFixedEf.inla getFixedEf.lm getFixedEf.lme getFixedEf.lmerMod
###   getFixedEf.logistf getFixedEf.matrix getFixedEf.mer
###   getFixedEf.MIresult getFixedEf2 getFormattedSummary getVarComponent
###   getVarComponent.hyperpar.inla getVarComponent.matrix
###   getVarComponent.lmerMod interaction.table predict.geese predict.tps
###   residuals.geese vcov.geese vcov.tps vcov.logistf risk.cal

### ** Examples


## Annette Dobson (1990) "An Introduction to Generalized Linear Models".
## Page 9: Plant Weight Data.
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)
lm.D9 <- lm(weight ~ group)
glm.D9 <- glm(weight ~ group)
getFormattedSummary (list(lm.D9, glm.D9), robust=FALSE)




