library(drc)


### Name: compParm
### Title: Comparison of parameters
### Aliases: compParm
### Keywords: models nonlinear

### ** Examples


# Fitting a model with names assigned to the parameters!
spinach.m1 <- drm(SLOPE~DOSE, CURVE, data = spinach,
fct = LL.4(names = c("b", "lower", "upper", "ed50")))

## Calculating ratios of parameter estimates for the parameter named "ed50"
compParm(spinach.m1, "ed50")      

## Calculating differences between parameter estimates for the parameter named "ed50"
compParm(spinach.m1, "ed50", "-")  




