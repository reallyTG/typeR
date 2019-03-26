library(JM)


### Name: piecewiseExp.ph
### Title: Proportional Hazards Models with Piecewise Constant Baseline
###   Hazard Function
### Aliases: piecewiseExp.ph
### Keywords: multivariate regression

### ** Examples

coxFit <- coxph(Surv(Time, death) ~ drug, data = aids.id, x = TRUE)
piecewiseExp.ph(coxFit)



