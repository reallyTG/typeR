library(jomo)


### Name: jomo.coxph
### Title: Joint Modelling Imputation Compatible with Cox Proportional
###   Hazards Model
### Aliases: jomo.coxph

### ** Examples

#define substantive model
formula<-as.formula(Surv(time, status) ~ measure + sex + I(measure^2))

#Run imputation
if (requireNamespace("survival", quietly = TRUE)) {
  library(survival)
  imp<-jomo.coxph(formula,surdata, nburn = 100, nbetween = 100, nimp=5)
}



